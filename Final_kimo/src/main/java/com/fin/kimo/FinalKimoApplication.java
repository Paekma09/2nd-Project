package com.fin.kimo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

@SpringBootApplication
@EnableWebSocket
public class FinalKimoApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalKimoApplication.class, args);
	}
	@GetMapping("/")
	public String root() {
		return "login";
	}


}
