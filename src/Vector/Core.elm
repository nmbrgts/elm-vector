module Vector.Core
    exposing
        ( Vector(..)
        , fromList
        , cross_
        , monomap
        , monofold
        )


type Vector
    = Vector
        { dimensions : Int
        , values : List Float
        }
    | Invalid


fromList : List Float -> Vector
fromList l =
    if List.length l > 0 && List.length l <= 3 then
        Vector { dimensions = List.length l, values = l }
    else
        Invalid


cross_ : List Float -> List Float -> Vector
cross_ l r =
    case ( l, r ) of
        ( a :: b :: [], c :: d :: [] ) ->
            Vector
                { dimensions = 2
                , values = [ 0, 0, a * d - b * c ]
                }

        ( a :: b :: c :: [], d :: e :: f :: [] ) ->
            Vector
                { dimensions = 3
                , values =
                    [ b * f - c * e
                    , c * d - a * f
                    , a * e - b * d
                    ]
                }

        ( _, _ ) ->
            Invalid


operable :
    { dimensions : Int, values : List Float }
    -> { dimensions : Int, values : List Float }
    -> Bool
operable u v =
    v.dimensions == v.dimensions


monomap : (Float -> Float -> Float) -> Vector -> Vector -> Vector
monomap f l r =
    case ( l, r ) of
        ( Invalid, _ ) ->
            Invalid

        ( _, Invalid ) ->
            Invalid

        ( Vector l, Vector r ) ->
            if operable l r then
                Vector { l | values = List.map2 f l.values r.values }
            else
                Invalid


monofold :
    (Float -> Float -> Float)
    -> Float
    -> Vector
    -> Float
monofold f b v =
    case v of
        Invalid ->
            -1

        Vector { dimensions, values } ->
            List.foldl f b values
