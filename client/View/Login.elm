module Login exposing (..)
import ChatRoom exposing (..)
import Model exposing (..)
import Html exposing (..)
import Message exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (style)
import Html exposing (..)
import Html.Attributes exposing (..)

head_in_loginPage:Model ->Html Msg
head_in_loginPage model= 
    div[
        style [
        ("background", "white")
        , ("padding-top", "5px")
        , ("padding-left", "29%")
        , ("height","55px" )
        , ("font-weight", "bold")
        , ("font-size","1.8rem")
        , ("font-family","Helvetica")
        , ("vertical-align","middle")
        , ("border", "2px solid #4D4D4D") 
        , ("border-radius", "5px") 
        ]
        ]
    [   text "Login Minions' Chatting Room"
        ,a[href "#/register" ][
            img [ src "images/register.jpg",
            style [
            ("width", "50px" )
            , ("margin-left", "16%")
            , ("height","50px" )
            ]
        ] [ ]]
        ,a[href "" ][
            img [ src "images/home.jpg",
            style [
            ("width", "50px" )
            , ("margin-left", "3%")
            , ("margin-right", "0px")
            , ("height","50px" )
            ]
        ] [ ]]
     ]


body_in_loginPage:Model -> Html Msg
body_in_loginPage model= 
    let localtion = model.currentRoute
    in
    div[][
    div[style[
        ("background", "#FFFFE0")
        , ("margin-top","13%")

        , ("margin-left","28%")
        --, ("margin-right","auto")

        , ("padding-left", "90px")
        , ("padding-top", "24px")

        , ("height","80px" )
        , ("width","360px" )
        , ("font-size","1.2rem")
        , ("font-family","Helvetica")
        , ("border", "5px solid #4D4D4D") 
        , ("border-radius", "25px") 
    ]]
    [
        div[][
            text "Username :", 
            input [onInput Input_Username][]
        ]
        ,div[][
           text "Password  :", 
           input [onInput Input_Password][]
        ]
    ]
    ,
        button[onClick Send_Login,
        style[
        ("background", "#545454")
      , ("margin-top", "1%")
      , ("margin-left", "28%")
      --, ("margin-right", "auto")
      , ("width", "460px" )
      , ("height","4%" )
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
    ]][button [onClick (UrlChange {localtion| hash = "#/login"}) ,
    style [
        ("background", "#545454")
        , ("font-size","1.3rem")
        , ("font-family","Helvetica")
        , ("font-weight", "bold")
        , ("color","white")
        , ("border", "0px solid #4D4D4D") 
    ]
    ][text "LOGIN!"]]
    ]
----------------
error_message_body_in_loginPage:Model -> Html Msg
error_message_body_in_loginPage model= 
    let localtion = model.currentRoute
    in
    div[][
    div[style[
        ("background", "#FFFFE0")
        , ("margin-top","13%")

        , ("margin-left","28%")
        --, ("margin-right","auto")

        , ("padding-left", "90px")
        , ("padding-top", "24px")

        , ("height","90px" )
        , ("width","360px" )
        , ("font-size","1.2rem")
        , ("font-family","Helvetica")
        , ("border", "5px solid #4D4D4D") 
        , ("border-radius", "25px") 
    ]]
    [
        div[][
            text "Username :", 
            input [onInput Input_Username][]
        ]
        ,div[][
           text "Password  :", 
           input [onInput Input_Password][]
        ]
        ,div[
        style[
            ("margin-left","5%")
            ,("margin-top","2%")
            ,("color","red")
            ,("font-size","0.9rem")
        ]
    ][text "Information is wrong, please check!"]
    
    ]
    ,
        button[onClick Send_Login,
        style[
        ("background", "#545454")
      , ("margin-top", "1%")
      , ("margin-left", "28%")
      --, ("margin-right", "auto")
      , ("width", "460px" )
      , ("height","4%" )
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
    ]][button [onClick (UrlChange {localtion| hash = "#/login"}) ,
    style [
        ("background", "#545454")
        , ("font-size","1.3rem")
        , ("font-family","Helvetica")
        , ("font-weight", "bold")
        , ("color","white")
        , ("border", "0px solid #4D4D4D") 
    ]
    ][text "LOGIN!"]]
    ]

whole_in_Login:  Model -> Html Msg
whole_in_Login model = div [] 
    [
        head_in_loginPage model,
        body_in_loginPage model
    ]

error_in_Login: Model -> Html Msg
error_in_Login model = div [] 
    [
        head_in_loginPage model,
        error_message_body_in_loginPage model
    ]


loginPage : Model -> Html Msg
loginPage model=
    case model.status of
        --Anonymous -> whole_in_Login model

        --Registered -> whole_in_Login model
    
        Loged -> whole_in_ChatRoom model
    
        Login_InfoErr -> error_in_Login model

        _ -> whole_in_Login model