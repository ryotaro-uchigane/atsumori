let localStream = null;
let peer = null;
let video = document.getElementById('my-video');
let room;
getMedia(video);


function getMedia(video) {
  navigator.getUserMedia = navigator.getUserMedia ||
                           navigator.webkitGetUserMedia||
                           window.navigator.mozGetUserMedia;

  window.URL = window.URL || window.webkitURL;

  navigator.getUserMedia({video: true, audio: false},
    function(stream) { // for success case
      console.log(stream);
      localStream = stream
      video.src = window.URL.createObjectURL(stream);
    }, function(err) { // for error case
      console.log(err);
    }
  );
}


peer = new Peer({
  key: "058778ca-19fc-49dc-b554-68b0054c358c",
  debug: 3
});

peer.on('open', function() {
  console.log("ok");
  room = setRoom(localStream);
});

function setRoom(newStream) {
  room = peer.joinRoom('test-room');
  room.on('open', function() {
    console.log("room open");
    this.replaceStream(newStream);
  });
  room.on('peerJoin', function() {
    console.log("peer Join!");
    this.replaceStream(newStream);
  });
  room.on('stream', function(stream) {
    console.log("recive stream");
    console.log(stream);
    let atherVideo = document.getElementById('athor-video');
    atherVideo.src = window.URL.createObjectURL(stream);
  });
  room.on('peerLeave', function() {
    console.log("peer Leave!");
  });
}
