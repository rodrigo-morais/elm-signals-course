module Thumbs where


import Html exposing (..)
import Html.Events exposing(..)

import StartApp.Simple as StartApp


-- MODEL
type alias Model =
  {
    ups : Int,
    downs : Int
  }

initialModel : Model
initialModel =
  {
    ups = 0,
    downs = 0
  }


-- UPDATE
type Action =
  NoOp
  | Up
  | Down


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model
    Up ->
      { model | ups = model.ups + 1 }
    Down ->
      { model | downs = model.downs + 1 }


-- VIEW
view : Signal.Address Action -> Model -> Html
view address model =
  div [ ]
      [
        button [ onClick address Down ]
               [ text ((toString model.downs) ++ " Thumbs Down") ],
        button [ onClick address Up ]
               [ text ((toString model.ups) ++ " Thumbs DUp") ],
        p [ ] [ text (toString model) ]
      ]


-- MAIN
main : Signal Html
main =
  StartApp.start { model = initialModel, update = update, view = view }