# http://dl.dropbox.com/u/20567085/Mattersoft%20Live!%20interface%20description%20v1_6.pdf

jQuery ->

  class ChooseYourDestination
    constructor: (@map, @selector, @marker) ->
      jQuery(@selector).on "click", @activate
      @marker = L.marker()

    drop: (mouse_evt) =>
      @marker.setLatLng(mouse_evt.latlng)
      @marker.addTo(@map)
      @map.off "click", @drop

    activate: (event) =>
      @map.on "click", @drop


  class MarkerConnector
      constructor: (@marker_start, @marker_end) ->


  [lat, lng] = [69.20148, 13.97096]

  navigator.geolocation.getCurrentPosition (location) ->
    lat = location.coords.latitude
    lng = location.coords.longitude

    marker.setLatLng [lat, lng]
    map.panTo [lat, lng]

  map = L.map('wrapper').setView([lat, lng], 17)

  chooser = new ChooseYourDestination(map, "#destination-chooser")

  L.tileLayer('http://{s}.tile.cloudmade.com/f15cc60d60784f14ad4586a462a675c3/997/256/{z}/{x}/{y}.png',{
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
    maxZoom: 17
  }).addTo(map)

  marker = L.marker([lat, lng]).addTo(map)
