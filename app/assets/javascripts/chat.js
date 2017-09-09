let localStream = null;
let peer = null;
let existingCall = null;
let video = document.getElementById('my-video');
getMedia(video);


function getMedia(video) {
  navigator.getUserMedia = navigator.getUserMedia ||
                           navigator.webkitGetUserMedia||
                           window.navigator.mozGetUserMedia;

  window.URL = window.URL || window.webkitURL;

  navigator.getUserMedia({video: true, audio: false},
    function(stream) { // for success case
      console.log(stream);
      video.src = window.URL.createObjectURL(stream);
    }, function(err) { // for error case
      console.log(err);
    }
  );
}
/*
peer = new Peer({
    key: "058778ca-19fc-49dc-b554-68b0054c358c",
    debug: 3
});
*/
