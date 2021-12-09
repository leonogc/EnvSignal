if(typeof mouseCoords == 'undefined'){
  
  let mouseCoords;
  let creating = false;
  let timerInterval;
  let mapRef;
  let mapObject;
  let markersArray = [];
  const LatLng = { lat: -23.4823919, lng: -46.5004498 };
  
  if(document.getElementById("map"))
  initMap()
  else
  document.addEventListener("DOMContentLoaded", function(){
    initMap()
  });
  
  function getAndSetMap() {
    mapRef = document.getElementById("map");
    if(!mapRef) return;
    
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
  }
  
  function asyncSetLocation(position){
    var data = "?latitude=" + position.lat + "&longitude=" + position.lng;
    $.ajax({
      method: "GET",
      url: "/setLocation" + data
    })
    .done(function(response){
      console.log("Set location OK!" + data);
    })
    .fail(function(error){
      console.log("Set location failed!" + data);
    });
  }
  
  function setMiddleMapLocation() {
    navigator.geolocation.getCurrentPosition(function (pos) {
      if (mapObject) {
        position = { lat: pos.coords.latitude, lng: pos.coords.longitude }
        mapObject.setCenter(position);
        new google.maps.Marker({
          position: position,
          mapObject,
          title: "You are here!",
        });
        asyncSetLocation(position);
      }
      
    },
    function (err) {
      mapObject.setCenter(LatLng);
      new google.maps.Marker({
        position: LatLng,
        mapObject,
        title: "Each!",
      });
      asyncSetLocation(LatLng);
      
    }
    )
  }
  
  function initMap() {
    getAndSetMap();
    setMiddleMapLocation();
    
    let infoWindow = new google.maps.InfoWindow({
      content: "Click the map to get Lat/Lng!",
      position: LatLng,
    });
    
    infoWindow.open(mapObject);
    mapObject.addListener("click", (mapsMouseEvent) => {
      mouseCoords = mapsMouseEvent.latLng.toJSON();
    });
    
    let userData = document.getElementById("data_self");
    if(userData)
    createAllMarkers(mapObject, userData, "user");
    
    let pendingData = document.getElementById("data_pending");
    if(pendingData)

    createAllMarkers(mapObject, pendingData, "pending");
    
    let verifiedData = document.getElementById("data_verified");
    if(verifiedData)
    createAllMarkers(mapObject, verifiedData, "verified");
    
    setUpMouseHold();
  }
  
  function createMarkerAndSetOnClick(mapObject, imgUrl, markerData) {
    var icon = {
      url: imgUrl, 
      scaledSize: new google.maps.Size(87, 75), 
      origin: new google.maps.Point(0, 0), 
      anchor: new google.maps.Point(43.5, 37.5)
    };
    
    let marker = new google.maps.Marker({
      position: { lat: parseFloat(markerData.latitude), lng: parseFloat(markerData.longitude) },
      icon: icon,
      map: mapObject,
    });
    
    google.maps.event.addListener(marker, 'click', () => window.location.assign(window.location.origin + `/markers/${markerData.id}`))
    
    marker.setMap(mapObject);
  }
  
  function createAllMarkers(mapObject, dataDiv, markerType) {
    if(dataDiv) {
      dataDiv = JSON.parse(dataDiv.innerHTML);
    }
    dataDiv.forEach((markerData) => {
      let imgUrl = "/";
      switch(markerData.disaster_type) {
        case "esgoto":
          imgUrl += `sewer`;
          break;
          case "incendio":
            imgUrl += "fire";
            break;
            case "vazamento":
              imgUrl += "leak";
              break;
              case "lixo":
                imgUrl += "trash";
                break;
              }
              imgUrl += `_${markerType}.png`;
              
              createMarkerAndSetOnClick(mapObject, imgUrl, markerData)
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
}