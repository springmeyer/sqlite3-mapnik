# sqlite-mapnik

Standalone sqlite plugin


# Setup

    cd deps
    mkdir -p build
    tar xvf sqlite-autoconf-3070701.tar.gz
    cd sqlite-autoconf-3070701/
    export CFLAGS="-DSQLITE_ENABLE_RTREE=1 -O3 -fPIC"
    ./configure --prefix=`pwd`/../build --enable-static --disable-shared
    make -j4 && make install
    cd ../../
    svn co http://svn.mapnik.org/trunk/plugins/input/sqlite/ sqlite_sources
    make
    # move any existing plugin out of the way to avoid segfaults
    mv `mapnik-config --input-plugins`/sqlite.input sqlite_plugin.backup



# Test:

If you have node and node-mapnik installed do:

    node test.js

If not install node-mapnik with npm:

    npm install mapnik

The `node test.js` should print some json about the data.


# Done testing?

Move the old sqlite plugin back into place:

    mv sqlite_plugin.backup `mapnik-config --input-plugins`/sqlite.input 
