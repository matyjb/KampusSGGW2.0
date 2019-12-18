const fs = require('fs');
var oldjson = require("./budynki.json");

var json2 = oldjson.map(e => {
  return {
    name: e.name,
    id: e.id,
    lat: e.position.latitude,
    lon: e.position.longitude,
    places: Array.isArray(e.descriptions.text) ? e.descriptions.text.map(
      el => {
        return
      }) :
      [
        {

        }
      ]
  }
})

var newjson = oldjson.map(e => {
  if (Array.isArray(e.descriptions.text)) {
    var places = e.descriptions.text.map(el => {
      name = el;
      let lat = 0;
      let lon = 0;
      let floor = "0";
      return {
        name,
        lat,
        lon,
        floor
      };
    });
  }
  else {
    name = e.descriptions.text;
    let lat = 0;
    let lon = 0;
    let floor = "0";
    places = {
      name,
      lat,
      lon,
      floor
    };
  }
  id = e.id;
  name = e.name;
  lat = Number(e.position.latitude);
  lon = Number(e.position.longitude);
  return {
    id,
    name,
    places,
    lat,
    lon
  }
});

var jsonContent = JSON.stringify(newjson);
fs.writeFile("budynki2.json", jsonContent, () => { });