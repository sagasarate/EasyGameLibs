#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.147                       #
#------------------------------------------------------------------------------#


WORKDIR = `pwd`

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = windres

INC = 
CFLAGS = -std=c++11
RESINC = 
LIBDIR = 
LIB = ../../Libs/MonoWrapper/lib/x64/CentOS6.5/libmonosgen-2.0.a -lpthread -lrt -ldl
LDFLAGS = -static-libgcc -static-libstdc++ -rdynamic -Wl,-Bstatic -luuid -Wl,-Bdynamic

SRC_CPP_FILES=$(shell find ./ -name "*.cpp")
HEADER_FILES=$(shell find ./ -name "*.h")

INC_DEBUG = $(INC)
CFLAGS_DEBUG = $(CFLAGS) -g -O0 -W -D_DEBUG
RESINC_DEBUG = $(RESINC)
RCFLAGS_DEBUG = $(RCFLAGS)
LIBDIR_DEBUG = $(LIBDIR)
LIB_DEBUG = ../../Libs/bin/ServerFrameWorkD.a ../../Libs/bin/DOSLibD.a ../../Libs/bin/NetLibD.a ../../Libs/bin/UtilsD.a $(LIB)
LDFLAGS_DEBUG = $(LDFLAGS)
OBJDIR_DEBUG = linux/Debug
DEP_DEBUG = 
OUT_DEBUG = ../Work/DistributedObjectServerD

INC_RELEASE = $(INC)
CFLAGS_RELEASE = $(CFLAGS) -g -W
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS)
LIBDIR_RELEASE = $(LIBDIR)
LIB_RELEASE = ../../Libs/bin/ServerFrameWork.a ../../Libs/bin/DOSLib.a ../../Libs/bin/NetLib.a ../../Libs/bin/Utils.a $(LIB)
LDFLAGS_RELEASE = $(LDFLAGS)
OBJDIR_RELEASE = linux/Release
DEP_RELEASE = 
OUT_RELEASE = ../Work/DistributedObjectServer

OBJ_CPP_DEBUG = $(SRC_CPP_FILES:%.cpp=$(OBJDIR_DEBUG)/%.o)

OBJ_CPP_RELEASE = $(SRC_CPP_FILES:%.cpp=$(OBJDIR_RELEASE)/%.o)

all: debug release

clean: clean_debug clean_release

before_debug: 
	test -d ../Work || mkdir -p ../Work
	test -d $(OBJDIR_DEBUG) || mkdir -p $(OBJDIR_DEBUG)

after_debug: 

debug: before_debug out_debug after_debug

out_debug: before_debug $(OBJ_CPP_DEBUG) $(LIBDIR_DEBUG) $(DEP_DEBUG)
	$(LD) $(LIBDIR_DEBUG) -o $(OUT_DEBUG) $(OBJ_CPP_DEBUG)  $(LDFLAGS_DEBUG) $(LIB_DEBUG)

$(OBJ_CPP_DEBUG):$(OBJDIR_DEBUG)/%.o:%.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c $< -o $@

clean_debug: 
	rm -f $(OBJ_CPP_DEBUG) $(OUT_DEBUG)

before_release: 
	test -d ../Work || mkdir -p ../Work
	test -d $(OBJDIR_RELEASE) || mkdir -p $(OBJDIR_RELEASE)

after_release: 

release: before_release out_release after_release

out_release: before_release $(OBJ_CPP_RELEASE) $(LIBDIR_RELEASE) $(DEP_RELEASE)
	$(LD) $(LIBDIR_RELEASE) -o $(OUT_RELEASE) $(OBJ_CPP_RELEASE)  $(LDFLAGS_RELEASE) $(LIB_RELEASE)

$(OBJ_CPP_RELEASE):$(OBJDIR_RELEASE)/%.o:%.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c $< -o $@

clean_release: 
	rm -f $(OBJ_CPP_RELEASE) $(OUT_RELEASE)

.PHONY: before_debug after_debug clean_debug before_release after_release clean_release

