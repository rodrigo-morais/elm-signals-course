import Graphics.Element exposing (..)

import Time exposing (..)



state : Signal Int
state =
  Signal.foldp (\_ count -> count + 1) 0 (Time.every Time.second)


main : Signal Element
main =
  Signal.map show state