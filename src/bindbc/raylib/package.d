//          Copyright 2021 - 2024 Orfeo Da Vià
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.raylib;

public import bindbc.raylib.types;
public import bindbc.raylib.colors;

version (BindBC_Static) {
   version = BindRaylib_Static;
}

version (BindRaylib_Static) {
   public import bindbc.raylib.bindstatic;
} else {
   public import bindbc.raylib.binddynamic;
}
