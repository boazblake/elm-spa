module Third.Views exposing (view)


import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (Model)
import Third.Updates exposing (Msg(..))
import Router exposing (Screen(..))

view : Model -> Html Msg
view model =
  div [] 
    [ a [href <| Router.url Main ] [ text "BACK HOME"]
    , h1 [] [ text "THIRD SCREEN"]
    , div [] 
      [ text "Button Pushed In This Screen: ", text <| toString model.third.counter
      ]
    , div []
      [ text "Button pushed in all screens: "
      , text <| toString model.globalCounter
      ]
    , div [] 
      [ button [onClick Increment ] [ text " ++"]]
    , div [] 
      [ button [onClick Decrement ] [ text " --"]]
    , div [] 
      [ button [onClick Reset ] [ text " Reset Third"]]
    ]