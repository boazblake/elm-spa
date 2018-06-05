module Login.Views exposing (..)

import Models exposing (Model)
import Login.Updates exposing (Msg(..))

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Router exposing (Screen(..))

view : Model -> Html Msg
view model =
 div []  [ a[ href <| Router.url Main ][ text "HOME"]
  , h1 [] [ text "LOGIN"]
  , div [] 
    [ input [ type_ "text", placeholder "enter name", onInput UserName ]
        []
    , input [ type_ "password", placeholder "enter password", onInput Password]
            []
    , input [ type_ "password", placeholder "check password", onInput PasswordCheck]
            []
           ] , viewValidation model
    
   ]
   
viewValidation : Model -> Html Msg
viewValidation model =
    let
      login = model.login
      (color, message) =
        if login.password == login.password_check then
        ("green", "ok")
        else 
        ("red", "passwords do not match")
    in
    div [style[("color", color)]]
      [ text message]