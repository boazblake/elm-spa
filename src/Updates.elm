module Updates exposing (..)

import Navigation exposing (Location)


import Models exposing (Model)
import Router exposing (screenFromLocation)
import First.Updates
import Second.Updates
import Third.Updates
import Login.Updates

type Msg
  = Reset
  | ChangeLocation Location
  | FirstEvent First.Updates.Msg
  | SecondEvent Second.Updates.Msg
  | ThirdEvent Third.Updates.Msg
  | LoginEvent Login.Updates.Msg

update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
  case msg of
    ChangeLocation location ->
      {model | screen = screenFromLocation location } ! []
    FirstEvent e ->
      wrapScreen FirstEvent <| First.Updates.update e model
    SecondEvent e ->
      wrapScreen SecondEvent <| Second.Updates.update e model
    ThirdEvent e ->
      wrapScreen ThirdEvent <| Third.Updates.update e model
    LoginEvent e ->
      wrapScreen LoginEvent <| Login.Updates.update e model
    _ -> model ! []

--helper to wraop screens

wrapScreen : (msg -> Msg) -> (Model, Cmd msg) -> (Model, Cmd Msg)
wrapScreen toMsg (model, cmd) =
  (model, Cmd.map toMsg cmd)