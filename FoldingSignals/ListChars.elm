import Graphics.Element exposing (..)
import Keyboard
import Char
import String


characters : Signal Char
characters =
    Signal.map Char.fromCode Keyboard.presses


state : Signal (List Char)
state =
  Signal.foldp (::) [] characters


main : Signal Element
main =
  Signal.map show state