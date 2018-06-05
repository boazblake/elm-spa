module Third.Updates exposing (..)

import Models exposing (Model)

type Msg
  = Reset
  | Increment
  | Decrement
  

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  let
    third = model.third
    counter = model.third.counter
  in
  case msg of
    Increment ->
        { model 
          | globalCounter = model.globalCounter + 1
          , third = { third | counter = counter + 1}
        } 
          ! []
    
    Decrement ->
            { model 
              | globalCounter = model.globalCounter - 1
              , third = { third | counter = counter - 1}
            } 
              ! []
        
    Reset ->
         { model 
            | globalCounter = model.globalCounter - third.counter
            , third = { third | counter = 0}
          } 
            ! []
              