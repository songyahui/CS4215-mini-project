module ChatAnonymous exposing (..)
import Message exposing (..)
import Model exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)
import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (..)

head_in_chatting_anonymous_view : Html Msg 
head_in_chatting_anonymous_view = 
    
    div[
        style [
        ("background", "white")
        , ("padding-top", "5px")
        , ("padding-left", "25%")
        , ("height","55px" )
        , ("font-weight", "bold")
        , ("font-size","1.8rem")
        , ("font-family","Helvetica")
        , ("vertical-align","middle")
        , ("border", "2px solid #4D4D4D") 
        , ("border-radius", "5px") 
        ]
        ]
    [   text "Welcome to Minions' Chatting Room"
        ,a[href "#/login" ][
            img [ src "images/login.jpg",
            style [
            ("width", "50px" )
            , ("margin-left", "12%")
            , ("height","50px" )
            ]
        ] [ ]]
        ,a[href "#/register" ][
            img [ src "images/register.jpg",
            style [
            ("width", "50px" )
            , ("margin-left", "3%")
            , ("margin-right", "0px")
            , ("height","50px" )
            ]
        ] [ ]]

     ]

chatting_anonymous_view: Model -> Html Msg
chatting_anonymous_view model=
    div[]
    [
    head_in_chatting_anonymous_view
    ,div [
        style
        [
            ("height","500px"),
            ("desplay","inline")
        ]
    ]
    [
    div [
        style [
        ("background", "#FFFFE0")
      , ("margin-top", "1%")
      , ("margin-left", "25%")
      --, ("margin-right", "10%")
      , ("width", "47%" )
      , ("height","55px" )
      , ("font-size","1rem")
      , ("font-family","Helvetica")
      , ("border", "1px solid #4D4D4D") 
      , ("border-radius", "5px") 
      , ("-webkit-box-shadow", "inset 0 5px 5px rgba(0, 0, 0, 0.075)") 
      , ("box-shadow", "inset 0 5px 5px rgba(0, 0, 0, 0.075)") 
      , ("-webkit-transition", "border-color ease-in-out .15s, box-shadow ease-in-out .15s")
      , ("transition", "border-color ease-in-out .15s, box-shadow ease-in-out .15s") 
      , ("padding","2px")
    ]
    ][
        img [ src "images/tip.png",
            style [
            ("width", "50px" )
            , ("margin-left", "3%")
            , ("margin-right", "0px")
            , ("height","50px" )
            ] ][]
        , text "Register Now ~ More functions are there waiting for you!"
    ]
    ,
    div [
      style [
        ("background", "#FFFFE0")
      , ("overflow", "scroll")
      , ("margin-top", "1%")
      , ("margin-left", "11%")
      --, ("margin-right", "10%")
      , ("width", "75%" )
      , ("height","55%" )
      , ("font-size","1.3rem")
      , ("font-family","Helvetica")
      , ("border", "5px solid #4D4D4D") 
      , ("border-radius", "5px") 
      , ("-webkit-box-shadow", "inset 0 5px 5px rgba(0, 0, 0, 0.075)") 
      , ("box-shadow", "inset 0 5px 5px rgba(0, 0, 0, 0.075)") 
      , ("-webkit-transition", "border-color ease-in-out .15s, box-shadow ease-in-out .15s")
      , ("transition", "border-color ease-in-out .15s, box-shadow ease-in-out .15s") 
      , ("padding","7px")

      ]
    ] (List.map viewMessage (model.show_messages))
    
    --div [] (List.map viewMessage (model.show_messages))
    ,input [type_ "text",onInput Input_Message,
    style[
      ("margin-top", "1%")
      , ("margin-left", "11%")
      --, ("margin-right", "10%")
      , ("width", "75%" )
      , ("height","6%" )
      , ("font-size","1.3rem")
      , ("font-family","Helvetica")
      , ("border", "5px solid #4D4D4D") 
      , ("border-radius", "5px") 
      , ("-webkit-box-shadow", "inset 0 5px 5px rgba(0, 0, 0, 0.075)") 
      , ("box-shadow", "inset 0 5px 5px rgba(0, 0, 0, 0.075)") 
      , ("-webkit-transition", "border-color ease-in-out .15s, box-shadow ease-in-out .15s")
      , ("transition", "border-color ease-in-out .15s, box-shadow ease-in-out .15s") 
      , ("padding","7px")  
    ]
      
    ] []
    ,button [onClick Send_Message,
    style[
        ("background", "#545454")
      , ("margin-top", "1%")
      , ("margin-left", "11%")
      --, ("margin-right", "10%")
      , ("width", "77%" )
      , ("height","7%" )
      , ("font-size","1.3rem")
      , ("color","white")
      , ("font-weight", "bold")
      , ("font-family","Helvetica")
      , ("border", "5px solid #4D4D4D") 
      , ("border-radius", "5px") 
      , ("-webkit-box-shadow", "inset 0 5px 5px rgba(0, 0, 0, 0.075)") 
      , ("box-shadow", "inset 0 5px 5px rgba(0, 0, 0, 0.075)") 
      , ("-webkit-transition", "border-color ease-in-out .15s, box-shadow ease-in-out .15s")
      , ("transition", "border-color ease-in-out .15s, box-shadow ease-in-out .15s") 
    ]
    ] [text "Send!"]
  ]
    ]

viewMessage : String -> Html msg  
viewMessage msg =
  div [] [text msg]
