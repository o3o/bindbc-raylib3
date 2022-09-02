#  Parser
From release 4.2 of raylib is not longer necessary to apply the patch.


```
$ cd parser
$ git clone git@github.com:raysan5/raylib.git
$ cp raylib/parser/raylib_parser.c .

```

## Apply patch
```
$ make
```
Make creates three files in `src` directory
- binddynamic.d
- bindstatic.d
- types.d
