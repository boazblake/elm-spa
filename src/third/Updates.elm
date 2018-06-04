module Third.Updates exposing (..)

import Models exposing (Model)

type Msg
  = Reset
  | Increment

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    Increment ->
      let
        third = model.third
        counter = model.third.counter
      in
        { model 
          | globalCounter = model.globalCounter + 1
          , third = { third | counter = counter + 1}
        } 
          ! []
    _ ->
      model ! []