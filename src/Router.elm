module Router exposing (Screen(..), screenFromLocation, url)

import Navigation exposing (Location)

-- Type defining the screens in the application

type Screen
  = Main
  | First
  | Second
  | Third

-- Type defining routing assocaitions ... url and scrrens

type alias Route =
  { screen : Screen
  , url : String
  }

-- List all routes

screens : List Route
screens =
  [ Route Main ""
  , Route First "first"
  , Route Second "second"
  , Route Third "third"
  ]
  
-- helper to go from screen from url
screenFromLocation : Location -> Screen
screenFromLocation location =
  let
    isCurrent route =
      "#" ++ route.url == (Debug.log "location" location.hash)
    
    screenList =
      List.filter isCurrent screens
  in
    case screenList of
      [ { screen } ] ->
        screen
      _ ->
        Main

--helper for generating URL
url : Screen -> String
url screen =
  case (route screen) of
    Just { url } ->
      "#" ++ url
    _ -> ""

route : Screen -> Maybe Route
route screen =
  let
    isCurrent route =
      route.screen == screen
    
    routes =
      List.filter isCurrent screens
  
  in
    case routes of
      [] 
        -> 
          Nothing
      
      route :: _ 
        ->
          Just route