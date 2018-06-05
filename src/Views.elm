module Views exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model)
import Updates exposing (Msg)
import Router exposing (Screen(..))
import First.Views
import Second.Views
import Third.Views

type Align
  = Left
  | Right
  | Center

view : Model -> Html Msg
view model =
  case model.screen of
    Main ->
      div [ style [("border", "#000 1px solid")]] 
        [ firstLink
        , secondLink
        , thirdLink
        , logo
        , copyright
        ]
    First ->
      wrapScreen Updates.FirstEvent <| First.Views.view model
    Second ->
      wrapScreen Updates.SecondEvent <| Second.Views.view model
    Third ->
      wrapScreen Updates.ThirdEvent <| Third.Views.view model

logo : Html Msg
logo =
  block Center
    [ img [ src "/logo.svg"
          , style
            [("width", "100%")]
          ]
      []
    ]

backLink : Html Msg
backLink =
  block Center [ a [ href <| Router.url Main] [text "BACK"] ]
  

firstLink : Html Msg
firstLink =
  block Left [ a [ href <| Router.url First] [text "FIRST"] ]
  

secondLink : Html Msg
secondLink =
  block Center [ a [ href <| Router.url Second] [text "SECOND"] ]
  

thirdLink : Html Msg
thirdLink =
  block Right [ a [ href <| Router.url Third] [text "THIRD"] ]

copyright : Html Msg
copyright =
  div [] [ text " co 2018 boazblake"]

block : Align -> List (Html Msg) -> Html Msg
block align elems =
  let
    textAlign =
      case align of
        Left ->
          "left"        
        Right ->
          "right"
        Center ->
          "center"
  in
    div [ style 
          [ ("display", "inline")
          , ("width", "33%")
          , ("margin", "10%")
          , ("text-align", textAlign)
          ]
        ] elems

wrapScreen : (msg -> Msg) -> Html msg -> Html Msg
wrapScreen 
  =
    Html.map