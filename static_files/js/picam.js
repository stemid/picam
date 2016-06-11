// Captive portal Javascript
// by Stefan Midjich
//
//


function refreshCameraImage() {
  var d = new Date();
  var url = 'http://'+window.location.hostname+':8081/?forcerefresh=';
  var forcerefresh = d.getTime();
  $('#raspi-camera').attr('src', url+forcerefresh);
}

$(document).ready(function() {
  window.setInterval("refreshCameraImage();", 1000);
});

