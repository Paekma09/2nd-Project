package com.fin.kimo.model.socket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fin.kimo.model.dto.Room;
import com.fin.kimo.model.dto.RoomService;
import com.fin.kimo.model.dto.WebSocketMessage;

@Component
public class SignalHandler extends TextWebSocketHandler {
    @Autowired
    private RoomService roomService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final ObjectMapper objectMapper = new ObjectMapper();

    private Map<String, Room> sessionIdToRoomMap = new HashMap<>();

    private static final String MSG_TYPE_TEXT = "text";
    private static final String MSG_TYPE_OFFER = "offer";
    private static final String MSG_TYPE_ANSWER = "answer";
    private static final String MSG_TYPE_ICE = "ice";
    private static final String MSG_TYPE_JOIN = "join";
    private static final String MSG_TYPE_LEAVE = "leave";

    @Override
    public void afterConnectionClosed(final WebSocketSession session, final CloseStatus status) {
        logger.debug("[ws] Session has been closed with status {}", status);
        sessionIdToRoomMap.remove(session.getId());
    }

    @Override
    public void afterConnectionEstablished(final WebSocketSession session) {
        sendMessage(session, new WebSocketMessage("Server", MSG_TYPE_JOIN, Boolean.toString(!sessionIdToRoomMap.isEmpty()), null, null));
    }

    @Override
    public void handleTextMessage(final WebSocketSession session, final TextMessage textMessage) {
        try {
            WebSocketMessage message = objectMapper.readValue(textMessage.getPayload(), WebSocketMessage.class);
            logger.debug("[ws] Message of {} type from {} received", message.getType(), message.getFrom());
            String userName = message.getFrom();
            String data = message.getData();

            Room room;
            switch (message.getType()) {
                case MSG_TYPE_TEXT:
                    logger.debug("[ws] Text message: {}", message.getData());
                    break;
                case MSG_TYPE_OFFER:
                case MSG_TYPE_ANSWER:
                case MSG_TYPE_ICE:
                    Object candidate = message.getCandidate();
                    Object sdp = message.getSdp();
                    logger.debug("[ws] Signal: {}",
                            candidate != null
                                    ? candidate.toString().substring(0, 64)
                                    : sdp.toString().substring(0, 64));

                    Room rm = sessionIdToRoomMap.get(session.getId());
                    if (rm != null) {
                        Map<String, WebSocketSession> clients = roomService.getClients(rm);
                        for(Map.Entry<String, WebSocketSession> client : clients.entrySet())  {
                            if (!client.getKey().equals(userName)) {
                                sendMessage(client.getValue(),
                                        new WebSocketMessage(
                                                userName,
                                                message.getType(),
                                                data,
                                                candidate,
                                                sdp));
                            }
                        }
                    }
                    break;
                case MSG_TYPE_JOIN:
                    logger.debug("[ws] {} has joined Room: #{}", userName, message.getData());
                    room = roomService.findRoomByStringId(data)
                            .orElseThrow(() -> new IOException("Invalid room number received!"));
                    roomService.addClient(room, userName, session);
                    sessionIdToRoomMap.put(session.getId(), room);
                    break;
                case MSG_TYPE_LEAVE:
                    logger.debug("[ws] {} is going to leave Room: #{}", userName, message.getData());
                    room = sessionIdToRoomMap.get(session.getId());
                    Optional<String> client = roomService.getClients(room).entrySet().stream()
                            .filter(entry -> Objects.equals(entry.getValue().getId(), session.getId()))
                            .map(Map.Entry::getKey)
                            .findAny();
                    client.ifPresent(c -> roomService.removeClientByName(room, c));
                    break;
                default:
                    logger.debug("[ws] Type of the received message {} is undefined!", message.getType());
            }
        } catch (IOException e) {
            logger.debug("An error occured: {}", e.getMessage());
        }
    }

    private void sendMessage(WebSocketSession session, WebSocketMessage message) {
        try {
            String json = objectMapper.writeValueAsString(message);
            session.sendMessage(new TextMessage(json));
        } catch (IOException e) {
            logger.debug("An error occured: {}", e.getMessage());
        }
    }
}
