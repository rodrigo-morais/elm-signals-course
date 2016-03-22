import Graphics.Element exposing (..)
import Keyboard

import Char

import String exposing (fromChar)

type alias Model = String

initialModel : Model
initialModel = ""


-- UPDATE
update : Char -> Model -> Model
update character model =
  model ++ (String.fromChar character)


-- SIGNALS
characters : Signal Char
characters =
  Signal.map Char.fromCode Keyboard.presses

model : Signal Model
model =
  Signal.foldp update initialModel characters


-- VIEW
view : Model -> Element
view model =
  show model


main : Signal Element
main =
  Signal.map view model