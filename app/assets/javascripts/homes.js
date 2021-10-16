let mouseCoords;
let creating = false;
let timerInterval;
let mapRef;
let mapObject;

function initMap() {
  mapRef = document.getElementById("map");

  const LatLng = { lat: -23.4823919, lng: -46.5004498 };

  mapObject = new google.maps.Map(mapRef, {
    zoom: 15,
    mapId: '188e86f6e0591009',
    center: LatLng,
    panControl: false,
    zoomControl: true,
    mapTypeControl: false,
    scaleControl: false,
    streetViewControl: false,
    overviewMapControl: false,
    rotateControl: false,
    fullscreenControl: false,
  });
  window.a = mapObject;

  navigator.geolocation.getCurrentPosition(function (pos) {
    if (mapObject) {
      position = { lat: pos.coords.latitude, lng: pos.coords.longitude }
      mapObject.setCenter(position);
      new google.maps.Marker({
        position: position,
        mapObject,
        title: "You are here!",
      });
    }

  },
    function (err) {
      mapObject.setCenter(LatLng);
      new google.maps.Marker({
        position: LatLng,
        mapObject,
        title: "Each!",
      });
    }
  )

  let infoWindow = new google.maps.InfoWindow({
    content: "Click the map to get Lat/Lng!",
    position: LatLng,
  });

  infoWindow.open(mapObject);
  // Configure the click listener.
  mapObject.addListener("click", (mapsMouseEvent) => {
    // Close the current InfoWindow.
    
    
    mouseCoords = mapsMouseEvent.latLng.toJSON();
  });
  setUpMouseHold();
}


function setUpMouseHold() {
  mapRef.addEventListener("mousedown", function () {
    timerInterval = setInterval(function () {
      creating = true;
    }, 500);
  });

  mapRef.addEventListener("mouseup", function () {
    setTimeout(() => {
      clearInterval(timerInterval);
      if (creating) {
        creating = false;
        createMarker();
      }
    });
  }, 100)
}

function createMarker() {
  var marker = new google.maps.Marker({
    position: mouseCoords,
    title: "bom dia",
    map: map,
  });
  marker.setMap(mapObject)


}

function removeMarker() {
  marker.setMap(null) // https://developers.google.com/maps/documentation/javascript/examples/marker-remove
}