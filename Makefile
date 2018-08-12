COMPILER=gcc
EXECUTABLE=my_gui
LIBS=`pkg-config --cflags --libs gtk+-3.0`
FLAGS=-Wall -O0
SOURCE=def_gui.c

$(EXECUTABLE) : $(SOURCE)
	$(COMPILER) $(FLAGS) $(LIBS) -o $(EXECUTABLE) $(SOURCE)
