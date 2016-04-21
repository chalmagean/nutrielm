module Nav.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Nav.Types exposing (..)


navView : Signal.Address Action -> NavModel -> Html
navView address model =
  div
    [ class "app-menu" ]
    [ div [ class "heading" ] [ text "Today" ]
    ]
