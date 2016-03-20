import Graphics.Element exposing (..)
import Keyboard
import Char
import String


characters : Signal Char
characters =
    Signal.map Char.fromCode Keyboard.presses


state : Signal String
state =
  Signal.foldp (\char text -> String.cons char text) "" characters

reverse : Signal String -> Signal String
reverse original =
  Signal.map String.reverse original


main : Signal Element
main =
  Signal.map show (reverse state)