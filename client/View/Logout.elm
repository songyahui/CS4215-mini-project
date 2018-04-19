module Logout exposing (..)
import Model exposing (..)
import Html exposing (..)
import Message exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)
import Html exposing (..)
import Html.Attributes exposing (..)

link : String -> String -> Html Msg
link name url =
    a [ href url ] [ text name ]

logoutPage : Model -> Html Msg
logoutPage model=
    div [style[
        ("width", "100%" )
        , ("height","100%" )
    ]]
    [
    div[
        style [
        ("background", "white")

        , ("margin-top" ,"200px")
        , ("margin-left" ,"auto")
        , ("margin-right" ,"auto")

        , ("text-align", "center")
        , ("width", "400px" )
        , ("height","65px" )
        , ("padding-top", "20px")
        , ("font-weight", "bold")
        , ("font-size","2rem")
        , ("font-family","Helvetica")
        , ("vertical-align","middle")
        , ("border", "5px solid #4D4D4D") 
        , ("border-radius", "15px") 
        ]
        ]
        [text "Thank you!",
        div [style[
        ("margin-top" ,"1%")
        , ("margin-left" ,"0%")
        , ("margin-right" ,"auto")
        , ("font-weight", "normal")
        , ("font-size","1rem")
        , ("font-family","Helvetica")
        , ("vertical-align","middle")
    ] ,onClick LOGOUT ] [  ]
    ]
    ]
    
    
    
    
    