.PHONY: all
TYP = ../src/bindbc/raylib/types.d
DYN = ../src/bindbc/raylib/binddynamic.d
STA = ../src/bindbc/raylib/bindstatic.d
D_FILE = $(TYP) $(DYN) $(STA)
TEMPLATE_FILE = ./templates/footer.txt ./templates/load.txt ./templates/types.txt

all: $(TYP) $(DYN) $(STA)

$(TYP): rlc raylib.json
	./rlc -f TYP -i raylib.json

$(DYN): rlc raylib.json
	./rlc -f DYN -i raylib.json
$(STA): rlc raylib.json
	./rlc -f STA -i raylib.json


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
