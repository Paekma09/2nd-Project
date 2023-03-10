'use strict';

const vgaButton = document.querySelector('#vga');
const qvgaButton = document.querySelector('#qvga');
const hdButton = document.querySelector('#hd');
const localVideo = document.querySelector('video');

let localStream;

const qvgaConstraints = {
    video: {width: {exact: 320}, height: {exact: 240}},
    audio: true
};
const vgaConstraints = {
    video: {width: {exact: 640}, height: {exact: 480}},
    audio: true
};
const hdConstraints = {
    video: {width: {exact: 1280}, height: {exact: 720}},
    audio: true
};

qvgaButton.onclick = () => {
    getMedia(qvgaConstraints);
};

vgaButton.onclick = () => {
    getMedia(vgaConstraints);
};

hdButton.onclick = () => {
    getMedia(hdConstraints);
};

function getMedia(constraints) {
    if (localStream) {
        localStream.getTracks().forEach(track => {
            track.stop();
        });
    }
    navigator.mediaDevices.getUserMedia(constraints)
        .then(getLocalMediaStream).catch(handleLocalMediaStreamError);
}

function getLocalMediaStream(mediaStream) {
    localStream = mediaStream;
    localVideo.srcObject = mediaStream;
}

function handleLocalMediaStreamError(error) {
    console.log('navigator.getUserMedia error: ', error);
}
