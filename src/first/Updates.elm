module First.Updates exposing (..)

import Models exposing (Model)

type Msg
  = Reset
  | Increment
  | Decrement

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  let
    first = model.first
    counter = model.first.counter
  in
    case msg of
    
      Reset ->
        { model 
          | globalCounter = model.globalCounter - first.counter
          , first = { first | counter = 0}
        } ! []
      
      Decrement ->
        { model
          | globalCounter = model.globalCounter - 1
          , first = { first | counter = counter - 1
                    }
        } ! []
        
      Increment ->
          { model 
            | globalCounter = model.globalCounter + 1
            , first = { first | counter = counter + 1
                      }
          } 
            ! []