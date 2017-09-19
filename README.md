# elm-vector
This is a library in elm that implements a simple interface to construct 2d and 3d vectors and perform common vector operations (addition, scale, cross, ect.). This library provides functions for doing common operations as well as infix operators. The two are separated into Vector.Prefix and Vector.Infix respectively.

Here are some examples, far from exhaustive:
```elm
-- prefix ex
import Vector.Prefix as Vector

u = Vector.fromList [1,1,1]
v = Vector.fromList [1,2,3]

uxv = Vector.cross u v
-- Vector { dimensions: 3, values : [1,-2,1]}
```
```elm
--infix ex
import Vector.Infix as Vector 
    exposing( (.+)
            , (.-)
            , (.*)
            , (.)
            , (><)
            )

u = Vector.fromList [1,1,1]
v = Vector.fromList [1,2,3]

uxv = u >< v
-- Vector { dimensions: 3, values : [1,-2,1]}
```

