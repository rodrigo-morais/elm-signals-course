module SpaceShip where

import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Color exposing (..)

import Keyboard
import Window
import Time


-- MODEL
type alias Model =
  {
    position : Int,
    powerLevel : Int,
    isFiring : Bool
  }


initialShip : Model
initialShip =
  {
    position = 0,
    powerLevel = 10,
    isFiring = False
  }


-- UPDATE
type Action =
  NoOp
  | Left
  | Right

update : Action -> Model -> Model
update action ship =
  case action of
    NoOp ->
      ship
    Left ->
      { ship | position = ship.position - 1 }
    Right ->
      { ship | position = ship.position + 1 }


-- VIEW
view : (Int, Int) -> Model -> Element
view (width, height) ship =
  let
    (width, height) = (400, 400)
    (width', height') = (toFloat width, toFloat height)
  in
    collage width height
      [
        drawGame width' height',
        drawShip height' ship,
        toForm (show ship)
      ]


drawGame : Float -> Float -> Form
drawGame width height =
  rect width height
  |> filled gray


drawShip : Float -> Model -> Form
drawShip gameHeight ship =
  let
    shipColor =
      if ship.isFiring then red else blue
  in
    ngon 3 30
    |> filled shipColor
    |> rotate (degrees 90)
    |> move ((toFloat ship.position), (50 - gameHeight / 2))
    |> alpha ((toFloat ship.powerLevel) / 10 )


-- SIGNALS

direction : Signal Action
direction =
  let
    x = Signal.map .x Keyboard.arrows
    delta = Time.fps 30

    toAction n =
      case n of
        -1 -> Left
        1  -> Right
        _  -> NoOp

    actions = Signal.map toAction x
  in
    Signal.sampleOn delta actions


model : Signal Model
model =
  Signal.foldp update initialShip direction


main : Signal Element
main =
  Signal.map2 view Window.dimensions model