module Main exposing (..)

import Navigation exposing (Location)
import Models exposing (Model)
import Views
import Updates

main =
  Navigation.program
    Updates.ChangeLocation
    { init = init
    , view = Views.view
    , update = Updates.update
    , subscriptions = (\_ -> Sub.none)
    }
    
init : Navigation.Location -> (Model, Cmd Updates.Msg)
init location =
  Models.init location ! []
  