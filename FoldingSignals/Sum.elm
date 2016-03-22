import Graphics.Element exposing (..)

import Keyboard
import Char

import String exposing (toInt, fromChar)


characters : Signal Char
characters =
    Signal.map Char.fromCode Keyboard.presses


parseInt : Char -> Maybe Int
parseInt character =
  case String.toInt (String.fromChar character) of
    Ok value ->
      Just value
    Err error ->
      Nothing


integers : Signal Int
integers =
  Signal.filterMap parseInt 0 characters


state : Signal Int
state =
  Signal.foldp (+) 0 integers


main : Signal Element
main =
  Signal.map show state