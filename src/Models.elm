module Models exposing (Model, init)


import Navigation exposing (Location)

import Router exposing (Screen(..), screenFromLocation)
import First.Models
import Second.Models
import Third.Models

type alias Model =
  { globalCounter : Int
  , screen : Screen
   --screen specific
  , first: First.Models.Model
  , second: Second.Models.Model
  , third: Third.Models.Model  
  }
  
init : Location -> Model
init location =
  { screen = screenFromLocation location
  , globalCounter = 0
  , first = First.Models.init
  , second = Second.Models.init
  , third = Third.Models.init
  }