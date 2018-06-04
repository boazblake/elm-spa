module Second.Updates exposing (..)

import Models exposing (Model)

type Msg
  = Reset
  | Increment

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
  
    Increment ->
      let
        second = model.second
        counter = model.second.counter
      in
        { model 
          | globalCounter = model.globalCounter + 1
          , second = { second | counter = counter + 1}
        } 
          ! []
    _ ->
      model ! []  