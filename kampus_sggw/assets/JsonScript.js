const fs = require('fs');
var oldjson = require("./budynki.json");

var newjson = oldjson.map(e => {
  return {
    // tu musisz dać tą reprezentacje jednego budynku co dałem na githubie
    // w starym jsonie tam gdzie jest descriptions.text to ten text nie jest zawsze tablicą więc użyj Array.isArray(object) do sprawdzenia
    // i jak nie jest to zrob z tego tablice z tym jednym "miejscem",
    // jak jest to uzyj .map do przemapowania "text" na tablice z obiektami takimi jak na githubie dałem
  }
});

var jsonContent = JSON.stringify(newjson);
fs.writeFile("budynki2.json", jsonContent, ()=>{});