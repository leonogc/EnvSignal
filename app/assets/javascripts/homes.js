function initMap(lat, lng) {
  var myCoords = new google.maps.LatLng(lat, lng);
  var mapOptions = {
  center: myCoords,
  zoom: 14,
  mapId: '188e86f6e0591009'
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
}