CC = g++
COMPILER_FLAGS = -w
LINKER_FLAGS = -lSDL2
OBJ_NAME = build/game

SRCDIR = src
BUILDDIR = build

SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))

all: $(OBJ_NAME)

$(OBJ_NAME): $(OBJECTS) | $(BUILDDIR)
	$(CC) $(OBJECTS) $(LINKER_FLAGS) -o $(OBJ_NAME)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CC) $(COMPILER_FLAGS) -c $< -o $@

$(BUILDDIR):
	mkdir -p $@

run: $(OBJ_NAME)
	./$(OBJ_NAME)

clean:
	rm -rf $(BUILDDIR)

.PHONY: all run clean

