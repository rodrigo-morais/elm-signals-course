import Graphics.Element exposing (..)
import Mouse
import Window


view : Int -> Int -> Element
view height y =
  let
    side = if y < height // 2 then "Top" else "Down"
  in
    show side


main =
  Signal.map2 view Window.height Mouse.y