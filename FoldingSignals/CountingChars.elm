import Graphics.Element exposing (..)
import Keyboard


state : Signal Int
state =
  Signal.foldp (\_ count -> count + 1) 0 Keyboard.presses


main : Signal Element
main =
  Signal.map show state