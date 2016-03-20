import Graphics.Element exposing (..)
import Keyboard
import Char


characters : Signal Char
characters =
    Signal.map Char.fromCode Keyboard.presses


main =
  Signal.map show characters