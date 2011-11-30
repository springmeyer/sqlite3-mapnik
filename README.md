# sqlite-mapnik

Standalone sqlite plugin


## Setup

Unpack and build sqlite3

    cd deps
    mkdir -p build
    tar xvf sqlite-autoconf-3070701.tar.gz
    cd sqlite-autoconf-3070701/
    export CFLAGS="-DSQLITE_ENABLE_RTREE=1 -O3 -fPIC"
    ./configure --prefix=`pwd`/../build --enable-static --disable-shared
    make -j4 && make install
    cd ../../

Plugin Mapnik's sqlite plugin locally

    git clone git://github.com/mapnik/mapnik.git mapnik_sources
    cp -r mapnik_sources/plugins/input/sqlite sqlite_sources

Now, make any changes to the mapnik sqlite sources and build locally like:

    make

To be able to test your local `sqlite.input` you need to move the globally installed one aside:

    mv `mapnik-config --input-plugins`/sqlite.input sqlite_plugin.backup

## Test

If you have node and node-mapnik installed do:

    node test.js

If not install node-mapnik with npm:

    npm install mapnik

The `node test.js` should print some json about the data.


## Done testing?

Move the old sqlite plugin back into place:

    mv sqlite_plugin.backup `mapnik-config --input-plugins`/sqlite.input 


## Troubleshooting

If the plugin compiles but mapnik does not recognize it as valid, try
opening it with python's ctypes which may reveal linking errors:

    import ctypes
    ctypes.CDLL('./sqlite.input')