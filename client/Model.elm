module Model exposing (..)
import Message exposing (..)
import Navigation

-- Model
type alias Model =
    { currentRoute : Navigation.Location
    , userId : Maybe String
    , userName : Maybe String
    , userPassword : Maybe String
    , userPassword_again : Maybe String
    , input_message : Maybe String
    , show_messages : List String
    , history_message : List String
    , online_user_list : List String
    , status: Status --0:anonymous 100:register 200:login
    }

type Status
    = Anonymous
    | Registered
    | Loged 
    | Login_InfoErr
    | Register_passwordErr
    | Register_existed


type RoutePath
    = DefaultRoute
    | LoginRoute
    | RegisterRoute
    | LogoutRoute
    | NotFoundRoute

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    { currentRoute = location
    , userId = Nothing
    , userName = Nothing
    , userPassword = Nothing
    , userPassword_again = Nothing
    , input_message = Nothing
    , show_messages = []
    , history_message = []
    , online_user_list = []
    , status = Anonymous
    } ! []