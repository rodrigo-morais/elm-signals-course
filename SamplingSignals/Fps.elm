import Graphics.Element exposing (..)
import Time


fps : Signal Time.Time
fps =
  Signal.map Time.inSeconds (Time.fps 2)


main : Signal Element
main =
  Signal.map show fps