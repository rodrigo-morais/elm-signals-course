import Graphics.Element exposing (..)
import Mouse
import Time


fps : Signal Time.Time
fps =
  Signal.map Time.inSeconds (Time.fps 15)


fpsPosition : Signal (Int, Int)
fpsPosition =
  Signal.sampleOn fps Mouse.position


main =
  Signal.map show fpsPosition