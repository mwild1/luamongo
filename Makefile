CXX= g++
LUA_INC= -I/usr/include/lua5.1/
CXXFLAGS= -g -O2 -shared -fPIC $(LUA_INC) -I/usr/include/mongo/
AR= ar rcu
RANLIB= ranlib
RM= rm -f
LIBS=-lmongoclient -lboost_thread -lboost_filesystem
OUTLIB=mongo.so

LDFLAGS= $(LIBS)

OBJS = main.o mongo_bsontypes.o mongo_dbclient.o mongo_replicaset.o mongo_connection.o mongo_cursor.o mongo_gridfile.o mongo_gridfs.o mongo_gridfschunk.o mongo_query.o utils.o

all: luamongo

clean:
	$(RM) $(OBJS) $(OUTLIB)

luamongo: $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(OUTLIB) $(LDFLAGS)

echo:
	@echo "CXX = $(CXX)"
	@echo "CXXFLAGS = $(CXXFLAGS)"
	@echo "AR = $(AR)"
	@echo "RANLIB = $(RANLIB)"
	@echo "RM = $(RM)"
	@echo "LDFLAGS = $(LDFLAGS)"

main.o: main.cpp utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_dbclient.o: mongo_dbclient.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_connection.o: mongo_connection.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_cursor.o: mongo_cursor.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_gridfile.o: mongo_gridfile.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_gridfs.o: mongo_gridfs.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_gridfschunk.o: mongo_gridfschunk.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_query.o: mongo_query.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_replicaset.o: mongo_replicaset.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
mongo_bsontypes.o: mongo_bsontypes.cpp common.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)
utils.o: utils.cpp common.h utils.h
	$(CXX) -c -o $@ $< $(CXXFLAGS)

.PHONY: all 
