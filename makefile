TARGET = app

INC = -Iinclude
GLUT = -lglut
GLU = -lGLU
GL = -lGL
SRC = src
INCLUDE = include
OBJ = obj

CC = g++
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)

vpath %.cpp $(SRC)
vpath %.h $(INCLUDE)

MAKE = $(CC) $(INC)

OBJ_FILE = $(addprefix $(OBJ)/, supportClass.o Mesh.o Lab2.o)
HEADER = $(wildcard $(INCLUDE)/*.h)

all: $(OBJ_FILE)
	$(MAKE) $(LFLAGS) $(OBJ_FILE) -o $(TARGET) $(GLUT) $(GLU) $(GL)

$(OBJ)/%.o: %.cpp ${HEADER}
	@mkdir -p $(OBJ) # create folder obj if not exist
	$(MAKE) $(CFLAGS) $< -o $@

clean:
	rm -f obj/*.o $(TARGET)
	@echo "Clean successfully"

run:
	./$(TARGET)
