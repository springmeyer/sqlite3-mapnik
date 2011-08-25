CXX = g++

CXXFLAGS = -O3 -Isqlite_sources/ $(shell mapnik-config --cflags)

LIBS = -Ldeps/build/lib -lsqlite3 $(shell mapnik-config --libs --ldflags) -licuuc

SRC = $(wildcard sqlite_sources/*.cpp)

OBJ = $(SRC:.cpp=.o)

BIN = sqlite3.input

all : $(SRC) $(BIN)

$(BIN) : $(OBJ)
	$(CXX) -dynamiclib $(OBJ) $(LIBS) -o $@  

.cpp.o :
	$(CXX) -c $(CXXFLAGS) $< -o $@

.PHONY : clean

clean: 
	rm -f $(OBJ)
	rm -f $(BIN)
