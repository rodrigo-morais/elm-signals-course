import Graphics.Element exposing (..)
import Window


area : (Int,Int) -> Int
area (w,h) =
  w * h


windowArea : Signal Int
windowArea =
  Signal.map area Window.dimensions


main =
  Signal.map show windowArea