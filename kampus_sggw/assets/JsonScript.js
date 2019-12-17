const fs = require('fs');

let json = fs.readFileSync('NewOne.json');
let data = JSON.parse(json);

class Object
{
    constructor(id,name,places,lat,lon)
    {
        this.id=id;
        this.name=name;
        this.places=places;
        this.lat=Number(lat);
        this.lon=Number(lon);
        for (let i = 0; i < places.length; i++) {
            this.places[i].lat=Number(places[i].lat);
            this.places[i].lon=Number(places[i].lon);
        }
    }
}

function GetObject(Id) {
    return Obj = new Object(data[Id].id,data[Id].name,data[Id].places,data[Id].lat,data[Id].lon);
}

console.log(GetObject(0));