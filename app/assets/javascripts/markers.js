
 document.addEventListener("DOMContentLoaded", function(){
  setParams();
 });

function setParams() {
  const latInput = document.getElementById("marker_latitude");
  const lngInput = document.getElementById("marker_longitude");

  const urlParams = new URLSearchParams(window.location.search);

  latInput.value = urlParams.get("lat");
  lngInput.value = urlParams.get("lng");
}