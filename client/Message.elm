module Message exposing (..)
import Navigation

type Msg
    = UrlChange Navigation.Location
    | Input_Message String
    | Input_Username String
    | Input_Password String
    | Input_Password_again String
    | Send_Register
    | Send_Login
    | Send_Message
    | Receive String
    | LOGOUT