module Main exposing (..)
import Message exposing (..)
import Model exposing (..)
import Update exposing (..)
import MainView exposing(..)
import Navigation



main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }






