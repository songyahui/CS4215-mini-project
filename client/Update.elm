module Update exposing (..)
import Helper exposing (..)
import WebSocket
import Message exposing (..)
import Model exposing (..)
import List exposing(..)

getString: Maybe String -> String
getString param = 
    case param of
    Just str -> str
    Nothing -> "Nothing"

sent_register_helper: Model -> ( Model, Cmd Msg)
sent_register_helper model= 
    let temp = "REGISTER|" ++ getString (model.userName) ++ "|" ++ getString (model.userPassword) ++"|"++ getString (model.userPassword_again)
    in ({ model | input_message = Nothing } ,WebSocket.send serverAddress temp)

sent_login_helper: Model -> ( Model, Cmd Msg)
sent_login_helper model= 
    let temp = "LOGIN|" ++getString(model.userName) ++ "|" ++ getString(model.userPassword)
    in ({ model | input_message = Nothing } ,WebSocket.send serverAddress temp)

sent_message_helper: Model -> ( Model, Cmd Msg)
sent_message_helper model= 
    let
        temp = "MESSAGE|" ++ getString (model.userId) ++ "|" ++getString(model.userName) ++ "|" ++ getString(model.userPassword) ++ "|" ++ getString(model.input_message)
    in
        ({ model | input_message = Nothing } , WebSocket.send serverAddress temp)

receive_helper: Model -> String-> ( Model, Cmd Msg)
receive_helper model str= 
    let
        list = str |> String.split "|" --|> drop 1
        message_type = head list
        messageList = drop 1 list 
    in  
        if getString(message_type) == "MESSAGE" 
        then  ({model|show_messages= List.append model.show_messages [getString(head messageList)]},Cmd.none)

        else if  getString(message_type) == "LOGIN" 
        then
            let temp_id =  getString(head messageList)
            
            in 
            if temp_id == "-1" then ({model| status = Login_InfoErr},Cmd.none)
            else ({model| userId = Just temp_id,status = Loged},Cmd.none)

        else if getString(message_type) == "REGISTER" 
        then 
            let temp_id =  getString(head messageList)
            in 
            if temp_id == "-1" then ({model| status = Register_passwordErr},Cmd.none) --
            else if temp_id == "-2" then ({model| status = Register_existed},Cmd.none)
            else ({model| userId = Just temp_id,status = Registered},Cmd.none)
        else --LOGIN_NEW
            let onlineUserstr =  getString(head messageList)
                onlineUserlist = onlineUserstr |> String.split "@"
            in ({model| online_user_list = onlineUserlist },Cmd.none)
    

update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
    case msg of
        UrlChange location ->
            ({ model | currentRoute = location } ,Cmd.none)

        Input_Message newInput ->
            ({ model | input_message = Just newInput } ,Cmd.none)

        Input_Username newInput ->
            ({ model | userName = Just newInput } ,Cmd.none)

        Input_Password newInput ->
            ({ model | userPassword = Just newInput } ,Cmd.none)

        Input_Password_again newInput ->
            ({ model | userPassword_again = Just newInput } ,Cmd.none)

        Send_Register ->
            sent_register_helper model

        Send_Login ->
            sent_login_helper model
            
        Send_Message -> 
            sent_message_helper model


        Receive str -> 
            receive_helper model str
        
        LOGOUT ->
            let temp = "LOGOUT|" ++ getString (model.userId)
            in
            ({ currentRoute = model.currentRoute
            , userId = Nothing
            , userName = Nothing
            , userPassword = Nothing
            , userPassword_again = Nothing
            , input_message = Nothing
            , show_messages = model.show_messages
            , history_message = []
            , online_user_list = []
            , status = Anonymous
            },WebSocket.send serverAddress temp)


-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
  WebSocket.listen serverAddress Receive
