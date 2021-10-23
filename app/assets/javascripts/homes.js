let mouseCoords;
let creating = false;
let timerInterval;
let mapRef;
let mapObject;

function initMap() {
  mapRef = document.getElementById("map");
  if(!mapRef) return;

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

  createAllMarkers(mapObject);
  setUpMouseHold();
}

function createAllMarkers(mapObject) {
  let data = document.getElementById("data");
  if(data) {
    data = JSON.parse(data.innerHTML);
  }
  data.forEach((markerData) => {
    let imgUrl = "/";
    switch(markerData.disaster_type) {
      case "esgoto":
        imgUrl += "sewer.png";
        break;
      case "incendio":
        imgUrl += "fire.png";
        break;
      case "vazamento":
        imgUrl += "leak.png";
        break;
      case "lixo":
        imgUrl += "trash.png";
        break;
    }

    var icon = {
      url: imgUrl, 
      scaledSize: new google.maps.Size(58, 50), 
      origin: new google.maps.Point(0,0), 
      anchor: new google.maps.Point(0, 0)
  };

    let marker = new google.maps.Marker({
      position: { lat: parseFloat(markerData.latitude), lng: parseFloat(markerData.longitude) },
      icon: icon,
      map: mapObject,
    });
    marker.setMap(mapObject);
  })  
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
  }, 200)
}

function createMarker() {
  window.location.assign(location.origin + "/markers/new?lat=" + mouseCoords.lat +  "&lng=" + mouseCoords.lng);
}

function removeMarker() {
  marker.setMap(null) // https://developers.google.com/maps/documentation/javascript/examples/marker-remove
}