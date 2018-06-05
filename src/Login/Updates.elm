module Login.Updates exposing (..)

import Models exposing (Model)


type Msg
  = UserName String
  | Password String
  | PasswordCheck String


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  let
    login = model.login
  in
    case msg of
      UserName name ->
        {model | login = {login | user_name = name }} ! []
      Password password ->
        { model | login = { login | password = password}} ! []
      PasswordCheck password ->
        { model | login= {login | password_check = password}} ! []