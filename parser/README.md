#  Parser
```
$ cd parser
$ git clone git@github.com:raysan5/raylib.git
$ cp raylib/parser/raylib_parser.c .
```
or
```
$ cd parser
$ git pull origin master --tags
$ git checkout v5 5.0
$ cp raylib/parser/raylib_parser.c .
```
fix in `template/footer.txt` the correct version:
```
} else {
      loadedVersion = RaylibSupport.raylib500;
}
```

then:
```
$ make
```
Make creates three files in `src` directory
- binddynamic.d
- bindstatic.d
- types.d
