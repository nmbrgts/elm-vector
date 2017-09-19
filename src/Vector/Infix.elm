module Vector.Infix
    exposing
        ( fromList
        , toList
        , (.+)
        , (.-)
        , (.*)
        , (.)
        , (><)
        )

import Vector.Core as Core exposing (Vector(..))
import Vector.Prefix as Prefix exposing (..)


fromList : List Float -> Vector
fromList =
    Core.fromList


toList : Vector -> List Float
toList =
    Core.toList


--add


(.+) : Vector -> Vector -> Vector
(.+) =
    Prefix.add



-- subtract


(.-) : Vector -> Vector -> Vector
(.-) =
    Prefix.subtract



-- scale


(.*) : Vector -> Vector -> Vector
(.*) =
    Prefix.scale



-- dot product


(.) : Vector -> Vector -> Float
(.) =
    Prefix.dot



-- cross product


(><) : Vector -> Vector -> Vector
(><) =
    Prefix.cross
