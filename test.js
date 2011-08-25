var mapnik = require('mapnik');

if (!mapnik.register_datasources('/Users/dane/projects/sqlite-mapnik')) {
    console.log('failed to register any new datasources');
}

var options = {
   type: "sqlite3",
   file: "data/world.sqlite",
   table: "world_merc"
}

var ds = new mapnik.Datasource(options);

console.log(ds.describe())
