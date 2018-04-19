module MainView exposing (..)
import Message exposing (..)
import Login exposing(..)
import Logout exposing(..)
import Register exposing(..)
import ChatAnonymous exposing (..)
import NotFound exposing (..)
import Model exposing (..)
import Html.Attributes exposing (style)
import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (..)

-- Navigation
fromUrlHash : String -> RoutePath
fromUrlHash urlHash =
    let
        hashList =
            urlHash |> String.split "/" |> drop 1
    in
        case hashList of
            [] ->
                DefaultRoute

            ["login" ] ->
                LoginRoute

            ["register" ] ->
                RegisterRoute

            ["logout"] ->
                LogoutRoute

            _ ->
                NotFoundRoute

pageBody : Model -> Html Msg
pageBody model =
    let
        routePath =
            fromUrlHash model.currentRoute.hash
    in
        case routePath of
            DefaultRoute ->
                chatting_anonymous_view model

            LoginRoute ->
                loginPage model

            RegisterRoute ->
                registerPage model

            LogoutRoute ->
                logoutPage model

            NotFoundRoute ->
                notFoundPage

view : Model -> Html Msg
view model =
    div [
        style [
        ("background", "url(images/minions_main.jpg)")
        , ("overflow", "scroll")
        , ("margin", "0")
        , ("width", "100%" )
        , ("height", "100%" )
        , ("position", "relative" )
        ]
    ][div [][pageBody model]]
