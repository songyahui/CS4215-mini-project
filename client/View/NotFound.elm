module NotFound exposing (..)
import Html exposing (..)
import Message exposing (..)

notFoundPage : Html Msg
notFoundPage =
    h1 [] [ text "Page Not Found" ]
