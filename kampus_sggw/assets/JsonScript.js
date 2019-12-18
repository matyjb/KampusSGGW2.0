const fs = require('fs');
var oldjson = require("./budynki.json");

var newjson = oldjson.map(e => {
  return {
    id: e.id,
    name: e.name,
    lat: e.position.latitude,
    lon: e.position.longitude,
    places: Array.isArray(e.descriptions.text) ? e.descriptions.text.map(
      el => {
      return {
        name: el,
        lat: null,
        lon: null,
        floor: null
      };
      }) :
      [
        {
          name: e.descriptions.text,
          lat: null,
          lon: null,
          floor: null
        }
      ]
  }
})
var jsonContent = JSON.stringify(newjson);
fs.writeFile("budynki2.json", jsonContent, () => { });