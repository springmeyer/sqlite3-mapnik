var mapnik = require('mapnik');

if (!mapnik.register_datasources('/Users/dane/projects/sqlite-mapnik')) {
    console.log('failed to register any new datasources');
}

var options = {
   type: "sqlite3",
   file: "world.sqlite"
}

var ds = new mapnik.Datasource(options);

