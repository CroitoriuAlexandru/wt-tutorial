# Compiler settings
CC = g++
CXXFLAGS = -std=c++14 -I.

# Makefile settings
APPNAME = wt-frontend-app
EXT = .cpp
SRCDIR = ./src
OBJDIR = ./src/obj

# Linking lib
LDFLAGS =  -lwthttp -lwt

# Runtime lib
RLIB = --docroot . --http-address 0.0.0.0 --http-port 9093


############## Creating variables #############
SRC = $(wildcard $(SRCDIR)/*$(EXT)) 
OBJ = $(SRC:$(SRCDIR)/%$(EXT)=$(OBJDIR)/%.o) $(UTIL:$(UTILDIR)/%$(EXT)=$(OBJDIR)/%.o) $(COMM:$(CMMDIR)/%$(EXT)=$(OBJDIR)/%.o)
DEP = $(OBJ:$(OBJDIR)/%.o=$(OBJDIR)/%.d)

########################################################################
####################### Targets beginning here #########################
########################################################################

all: $(APPNAME)

# Builds the app
$(APPNAME): $(OBJ) 
	$(CC) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

# Creates the dependecy rules
$(OBJDIR)/%.d: $(SRCDIR)/%$(EXT)
	@$(CXX) $(CXXFLAGS) $< -MM -MT $(@:.d=.o) >$@

# Includes all .h files
-include $(DEP)

# Building rule for .o files and its .c/.cpp in combination with all .h
$(OBJDIR)/%.o: $(SRCDIR)/%$(EXT) 
	$(CC) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/%.o: $(CMMDIR)/%$(EXT)
	$(CC) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/%.o: $(UTILDIR)/%$(EXT)
	$(CC) $(CXXFLAGS) -o $@ -c $<

################## Run #################
run:
	./$(APPNAME) $(RLIB)

.PHONY: gen_obj_dir
gen_obj_dir:
	mkdir -p $(OBJDIR)

################### Cleaning rules ###################
.PHONY: clean
clean:
	$(RM) $(APPNAME) $(DEP) $(OBJ)

cleanDependencies:
	$(RM) $(DEP)

################### Tailwind commands ###################
startTailwind: buildTailwindModules
	cd resources/themes/tailwind && npx tailwindcss -i ./src/input.css -o ./dist/tailwind.css --watch

