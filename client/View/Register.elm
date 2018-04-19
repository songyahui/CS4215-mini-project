module Register exposing (..)
import Html exposing (..)
import Logout exposing (..)
import Html.Attributes exposing (style)
import Html.Attributes exposing (..)
import Message exposing (..)
import Model exposing (..)
import Html.Events exposing (..)

head_in_registerPage:Model ->Html Msg
head_in_registerPage model= 
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
    [   text "Register for Minions' Chatting Room"
        ,a[href "#/login" ][
            img [ src "images/login.jpg",
            style [
            ("width", "50px" )
            , ("margin-left", "12%")
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

body_in_registerPage:Model -> Html Msg
body_in_registerPage model= 
    let localtion = model.currentRoute
    in
    div[][
    div[style[
        ("background", "#FFFFE0")
        , ("margin-top","13%")

        , ("margin-left","28%")
        --, ("margin-right","auto")

        , ("padding-left", "70px")
        , ("padding-top", "24px")

        , ("height","105px" )
        , ("width","380px" )
        , ("font-size","1.2rem")
        , ("font-family","Helvetica")
        , ("border", "5px solid #4D4D4D") 
        , ("border-radius", "25px") 
    ]]
    [
        div[][
            text "Username:", 
            input [onInput Input_Username][]
        ]
        ,div[][
           text "Password:", 
           input [onInput Input_Password][]
        ]
        ,div[][
           text "Password again:", 
           input [onInput Input_Password_again][]
        ]
        
    ]
    ,
        button[onClick Send_Register,
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
    ]
        
        
        
        ][button [onClick (UrlChange {localtion| hash = "#/register"}),
        style [
        ("background", "#545454")
        , ("font-size","1.3rem")
        , ("font-family","Helvetica")
        , ("font-weight", "bold")
        , ("color","white")
        , ("border", "0px solid #4D4D4D") 
    ] ][text "REGISTER!"]]
    ]

whole_in_Register: Model -> Html Msg
whole_in_Register model = div[]
    [
        head_in_registerPage model,
        body_in_registerPage model
    ]

after_Registered: Model -> Html Msg
after_Registered model = 
    div[
        style[
            ("font-family","Helvetica")
            ,("align","center")
        ]
    ][
    div [style [
        ("background", "#FFFFE0")
        , ("margin-top","20%")
        , ("margin-left","28%")
        , ("padding-left", "90px")
        , ("padding-top", "24px")
        , ("font-weight", "bold")
        , ("height","75px" )
        , ("width","360px" )
        , ("font-size","1.3rem")

        , ("font-family","Helvetica")
        , ("border", "5px solid #4D4D4D") 
        , ("border-radius", "25px") 
       ] ] [ 
            div[][text "Successfully registered!"]
            ,
            div[
                style [
                ("font-size","1rem")
                ,("margin-top","10px")
                , ("font-weight", "normal")

                ,("margin-left","80px")
                ]
            ][
            link "Login Now!" "#/login" ]]
        ]


not_possible: Model -> Html Msg
not_possible model = div [][text "not possible"]



passwordErr_in_Register: Model -> Html Msg
passwordErr_in_Register model = div[]
    [
        head_in_registerPage model,
        passworderror_body_in_registerPage model
    ]

-------------------
passworderror_body_in_registerPage:Model -> Html Msg
passworderror_body_in_registerPage model= 
    let localtion = model.currentRoute
    in
    div[][
    div[style[
        ("background", "#FFFFE0")
        , ("margin-top","13%")

        , ("margin-left","28%")
        --, ("margin-right","auto")

        , ("padding-left", "70px")
        , ("padding-top", "24px")

        , ("height","120px" )
        , ("width","380px" )
        , ("font-size","1.2rem")
        , ("font-family","Helvetica")
        , ("border", "5px solid #4D4D4D") 
        , ("border-radius", "25px") 
    ]]
    [
        div[][
            text "Username:", 
            input [onInput Input_Username][]
        ]
        ,div[][
           text "Password:", 
           input [onInput Input_Password][]
        ]
        ,div[][
           text "Password again:", 
           input [onInput Input_Password_again][]
        ]
        ,div[
        style[
            ("margin-left","7%")
            ,("margin-top","2%")
            ,("color","red")
            ,("font-size","0.9rem")
        ]
    ][text "Password Inconsist! Plese check!"]
        
    ]
    ,
        button[onClick Send_Register,
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
    ]
        
        

        ][button [onClick (UrlChange {localtion| hash = "#/register"}),
        style [
        ("background", "#545454")
        , ("font-size","1.3rem")
        , ("font-family","Helvetica")
        , ("font-weight", "bold")
        , ("color","white")
        , ("border", "0px solid #4D4D4D") 
    ] ][text "REGISTER!"]]
    ]
    -----------
existederror_body_in_registerPage:Model -> Html Msg
existederror_body_in_registerPage model= 
    let localtion = model.currentRoute
    in
    div[][
    div[style[
        ("background", "#FFFFE0")
        , ("margin-top","13%")

        , ("margin-left","28%")
        --, ("margin-right","auto")

        , ("padding-left", "70px")
        , ("padding-top", "24px")

        , ("height","120px" )
        , ("width","380px" )
        , ("font-size","1.2rem")
        , ("font-family","Helvetica")
        , ("border", "5px solid #4D4D4D") 
        , ("border-radius", "25px") 
    ]]
    [
        div[][
            text "Username:", 
            input [onInput Input_Username][]
        ]
        ,div[][
           text "Password:", 
           input [onInput Input_Password][]
        ]
        ,div[][
           text "Password again:", 
           input [onInput Input_Password_again][]
        ]
        ,div[
        style[
            ("margin-left","7%")
            ,("margin-top","2%")
            ,("color","red")
            ,("font-size","0.9rem")
        ]
    ][text "Username has already existed!"]
    ]
    ,
        button[onClick Send_Register,
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
    ]
        
        
        
        ][button [onClick (UrlChange {localtion| hash = "#/register"}),
        style [
        ("background", "#545454")
        , ("font-size","1.3rem")
        , ("font-family","Helvetica")
        , ("font-weight", "bold")
        , ("color","white")
        , ("border", "0px solid #4D4D4D") 
    ] ][text "REGISTER!"]]
    ]


----------------
existedErr_in_Register: Model -> Html Msg
existedErr_in_Register model = div[]
    [
        head_in_registerPage model,
        existederror_body_in_registerPage model
    ]

registerPage : Model -> Html Msg
registerPage model=
    case model.status of
        Anonymous -> whole_in_Register model

        Registered -> after_Registered model
    
        Loged -> not_possible model
    
        Register_passwordErr -> passwordErr_in_Register model

        Register_existed -> existedErr_in_Register model

        _ -> whole_in_Register model
