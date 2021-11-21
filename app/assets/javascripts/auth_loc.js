    navigator.geolocation.getCurrentPosition(function (pos) {
        var data = "latitude=" + pos.coords.latitude + ",longitude=" + pos.coords.longitude;
        $.ajax({
            url: '/setLocation',
            data: data,
            type: 'post'
        })
        .done(function(response){
            console.log("Set location OK!");
        })
        .fail(function(error){
            console.log("Set location failed!");
        });
    },
    function (err) {
        var data = "latitude=-23.4823919,longitude=-46.5004498";
        $.ajax({
            url: '/setLocation',
            data: data,
            type: 'post'
        })
        .done(function(response){
            console.log("Set location OK!");
        })
        .fail(function(error){
            console.log("Set location failed!");
        });
    }
  )
