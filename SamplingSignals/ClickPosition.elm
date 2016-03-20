import Graphics.Element exposing (..)
import Mouse


clickPosition : Signal (Int, Int)
clickPosition =
  Signal.sampleOn Mouse.clicks Mouse.position


main =
  Signal.map show clickPosition