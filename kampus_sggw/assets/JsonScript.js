const fs = require('fs');
var oldjson = require("./budynki_old.json");

var newjson = oldjson.map(e => {
  return {
    id: e.id,
    name: e.name,
    lat: Number(e.position.latitude),
    lon: Number(e.position.longitude),
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
fs.writeFile("budynki_new.json", jsonContent, () => { });