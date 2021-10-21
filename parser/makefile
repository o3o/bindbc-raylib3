.PHONY: all
D_FILE = ../src/bindbc/raylib/binddynamic.d

all: $(D_FILE)

$(D_FILE): rlc raylib.json
	./rlc -i raylib.json
rlc: app.d
	dmd -Jtemplates -of$@ $^

raylib.json: parser raylib/src/raylib.h
	./parser -i raylib/src/raylib.h -f JSON -o $@

parser: raylib_parser.c
	gcc -o$@ $^
clean:
	-rm $(D_FILE)
	-rm raylib.json


