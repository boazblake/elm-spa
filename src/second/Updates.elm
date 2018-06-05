module Second.Updates exposing (..)

import Models exposing (Model)

type Msg
  = Reset
  | Increment
  | Decrement

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  let
    second = model.second
    counter = model.second.counter
  in
       
    case msg of
      Decrement ->
        { model 
          | globalCounter = model.globalCounter - 1
          , second = { second | counter = counter - 1}
        } 
          ! []
      
      Increment ->
          { model 
            | globalCounter = model.globalCounter + 1
            , second = { second | counter = counter + 1}
          } 
            ! []
      Reset ->
        { model 
          | globalCounter = model.globalCounter - second.counter
          , second = { second | counter = 0 }
        } ! []  