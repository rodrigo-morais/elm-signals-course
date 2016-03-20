import Graphics.Element exposing (..)
import Keyboard
import Char


characters : Signal Char
characters =
    Signal.map Char.fromCode Keyboard.presses


isDigit : Signal Bool
isDigit =
    Signal.map Char.isDigit characters


main =
  Signal.map show isDigit