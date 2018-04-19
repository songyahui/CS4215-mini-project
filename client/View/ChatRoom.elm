module ChatRoom exposing (..)
import Message exposing (..)
import Model exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)
import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (..)
import Time.Date as Date exposing (Date, date)


getString1: Maybe String -> String
getString1 param = 
    case param of
    Just str -> str
    Nothing -> "Nothing"

head_in_chatRoom: Model ->Html Msg
head_in_chatRoom model = 
    div[
        style [
        ("background", "white")
        , ("padding-top", "5px")
        , ("padding-left", "35%")
        , ("height","55px" )
        , ("font-weight", "bold")
        , ("font-size","1.8rem")
        , ("font-family","Helvetica")
        , ("vertical-align","middle")
        , ("border", "2px solid #4D4D4D") 
        , ("border-radius", "5px") 
        ]
        ]
    [   text ("Hello! User : "++(getString1 (model.userName)) ++"!" )
        ,a[onClick LOGOUT, href "#/logout" ][
            img [ src "images/logout.jpg",
            style [
            ("width", "45px" )
            , ("margin-left", "200px")
            , ("margin-right", "0px")
            , ("height","50px" )
            ]
        ] [ ]]
     ]


body_in_chatRoom: Model ->Html Msg
body_in_chatRoom model = 
    div[]
    [
    div [
        style[("height","500px")]
    ]
    [
    div [
      style [
        ("background", "#FFFFE0")
      , ("overflow", "scroll")
      , ("margin-top", "1%")
      , ("margin-left", "11%")
      --, ("margin-right", "10%")
      , ("width", "75%" )
      , ("height","20%" )
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
    ] (List.map viewMessage (model.online_user_list))
    ----------------------------------------------
    
    --------------------------
    ,div [
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
    ,input [onInput Input_Message,
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


whole_in_ChatRoom : Model ->Html Msg
whole_in_ChatRoom model = div []
        [
            head_in_chatRoom model,
            body_in_chatRoom model
        ]