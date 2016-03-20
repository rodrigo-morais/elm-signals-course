import Graphics.Element exposing (..)
import Time


main =
  Signal.map show (Time.every Time.second)