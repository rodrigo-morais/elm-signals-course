import Graphics.Element exposing (..)
import Keyboard


main =
  Signal.map show Keyboard.presses