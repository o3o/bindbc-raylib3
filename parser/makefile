.PHONY: all
TYP = ../src/bindbc/raylib/types.d
DYN = ../src/bindbc/raylib/binddynamic.d
D_FILE = ../src/bindbc/raylib/binddynamic.d ../src/bindbc/raylib/types.d
TEMPLATE_FILE = ./templates/footer.txt ./templates/load.txt ./templates/types.txt

all: $(TYP) $(DYN)

$(TYP): rlc raylib.json
	./rlc -f TYP -i raylib.json

$(DYN): rlc raylib.json
	./rlc -f DYN -i raylib.json

rlc: app.d $(TEMPLATE_FILE)
	dmd -Jtemplates -of$@ $<

raylib.json: parser raylib/src/raylib.h
	./parser -i raylib/src/raylib.h -f JSON -o $@

parser: raylib_parser.c
	gcc -o$@ $^

clean:
	-rm $(TYP)
	-rm $(DYN)
	-rm raylib.json
