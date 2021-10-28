
 document.addEventListener("DOMContentLoaded", function(){
  setParams();
 });

function setParams() {
  const latInput = document.getElementById("markers_latitude");
  const lngInput = document.getElementById("markers_longitude");

  const urlParams = new URLSearchParams(window.location.search);

  latInput.value = urlParams.get("lat");
  lngInput.value = urlParams.get("lng");
}