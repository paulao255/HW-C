##############
# Variables: #
##############

APPLICATION_NAME = HW-C
PROGRAM_NAME = hw-c

CC = clang
CPPC = clang++
CSTD = c90
CPPSTD = c++98

FLAGS = -fdiagnostics-color=always -Wall -Wextra -Wpedantic -Wshadow -Wconversion -Wsign-conversion -Wformat=2 -Wnull-dereference -Wcast-align -Wpointer-arith -Wundef -Os -funroll-loops -fstack-protector-strong -v
LINKFLAGS = -flto -fPIE -pie
CFLAGS = -std=$(CSTD) $(FLAGS) $(LINKFLAGS) -Wstrict-prototypes -Wmissing-prototypes
CPPFLAGS = -std=$(CPPSTD) $(FLAGS) $(LINKFLAGS)

INCLUDES =

LIBS =

SRCS = ../src/Main.c
OBJS =

##############
# Functions: #
##############

.PHONY: all run install uninstall clean

all:
	@if [ ! -d "build" ]; then mkdir build; fi
	@if [ ! -d "build/bin" ]; then mkdir build/bin; fi
ifeq ($(OS), Windows_NT)
	cd build && $(CC) $(SRCS) $(OBJS) $(INCLUDES) $(CFLAGS) $(LIBS) -o bin\$(PROGRAM_NAME).exe
else
	cd build && $(CC) $(SRCS) $(OBJS) $(INCLUDES) $(CFLAGS) $(LIBS) -o bin/$(PROGRAM_NAME)
endif

run: all
ifeq ($(OS), Windows_NT)
	.\build\bin\$(PROGRAM_NAME).exe
else
	./build/bin/$(PROGRAM_NAME)
endif

install: all
ifeq ($(OS), Windows_NT)
	@if not exist "C:\Program Files" mkdir "C:\Program Files"
	@if not exist "C:\Program Files\$(APPLICATION_NAME)" mkdir "C:\Program Files\$(APPLICATION_NAME)"
	copy build\bin\$(PROGRAM_NAME).exe "C:\Program Files\$(APPLICATION_NAME)\$(PROGRAM_NAME).exe"
	powershell -Command "$$s=(New-Object -COM WScript.Shell).CreateShortcut([Environment]::GetFolderPath('Desktop')+'\$(PROGRAM_NAME).lnk');$$s.TargetPath='C:\Program Files\$(APPLICATION_NAME)\$(PROGRAM_NAME).exe';$$s.Save()"
	rmdir /s /q build
else
	sudo cp build/bin/$(PROGRAM_NAME) /usr/local/bin/$(PROGRAM_NAME)
	rm -fr build
endif

uninstall:
ifeq ($(OS), Windows_NT)
	@if exist "C:\Program Files\$(APPLICATION_NAME)\$(PROGRAM_NAME).exe" del "C:\Program Files\$(APPLICATION_NAME)\$(PROGRAM_NAME).exe" && rmdir "C:\Program Files\$(APPLICATION_NAME)"
	@if exist "C:\Users\%USERNAME%\Desktop\$(PROGRAM_NAME).lnk" del "C:\Users\%USERNAME%\Desktop\$(PROGRAM_NAME).lnk"
else
	sudo rm -f /usr/local/bin/$(PROGRAM_NAME)
endif

clean:
ifeq ($(OS), Windows_NT)
	@if exist build rmdir /s /q build
else
	rm -rf build
endif
