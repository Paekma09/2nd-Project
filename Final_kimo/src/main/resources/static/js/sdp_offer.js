'use strict';

const audioInput = document.querySelector('input#audio');
const restartInput = document.querySelector('input#restart');
const vadInput = document.querySelector('input#vad');
const videoInput = document.querySelector('input#video');

const outputTextarea = document.querySelector('textarea#output');
const createOfferButton = document.querySelector('button#createOffer');

createOfferButton.addEventListener('click', createOffer);

async function createOffer() {
    outputTextarea.value = '';
    const peerConnection = new RTCPeerConnection(null);
    const acx = new AudioContext();
    const dst = acx.createMediaStreamDestination();

    const offerOptions = {
        offerToReceiveAudio: (audioInput.checked) ? 1 : 0,
        offerToReceiveVideo: (videoInput.checked) ? 1 : 0,
        voiceActivityDetection: vadInput.checked,
        iceRestart: restartInput.checked
    };

    try {
        const offer = await peerConnection.createOffer(offerOptions);
        outputTextarea.value = offer.sdp;
    } catch (e) {
        outputTextarea.value = `Failed to create offer: ${e}`;
    }
}
