# sqlite-mapnik

Standalone sqlite plugin


# Setup

    cd deps
    mkdir -p build
    tar xvf sqlite-autoconf-3070701.tar.gz
    cd sqlite-autoconf-3070701/
    export CFLAGS="-DSQLITE_ENABLE_RTREE=1 -O3"
    ./configure --prefix=`pwd`/../build --enable-static --disable-shared
    make -j4 && make install
    cd ../../
    svn co http://svn.mapnik.org/trunk/plugins/input/sqlite/ sqlite_sources
    patch sqlite_sources/sqlite_datasource.cpp sqlite_datasource_name.diff
    make
    # move any existing plugin out of the way to avoid segfaults
    mv `mapnik-config --input-plugins`/sqlite.input sqlite_plugin.backup



# Test:

If you have node and node-mapnik installed do:

    node test.js


This should print some json about the data.


# Done testing?

Move the old sqlite plugin back into place:

    mv sqlite_plugin.backup `mapnik-config --input-plugins`/sqlite.input 


# Usage:

This will create an sqlite3.input (as apposed to the sqlite.input installed by mapnik).

Datasources can then be created by copying this to `mapnik-config --input-plugins` and referencing it like:

    mapnik.Datsource({type : "sqlite3"});

