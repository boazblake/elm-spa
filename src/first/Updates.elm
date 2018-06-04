module First.Updates exposing (..)

import Models exposing (Model)

type Msg
  = Reset
  | Increment

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
  
    Increment ->
      let
        first = model.first
        counter = model.first.counter
      in
        { model 
          | globalCounter = model.globalCounter + 1
          , first = { first | counter = counter + 1}
        } 
          ! []
    _ ->
      model ! []