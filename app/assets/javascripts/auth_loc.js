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

  var data = "?latitude=" + position.lat + "&longitude=" + position.lng;
  $.ajax({
    method: "GET",
    url: "/setLocation?" + data
  })
  .done(function(response){
    console.log("Set location OK!");
  })
  .fail(function(error){
    console.log("Set location failed!");
  });