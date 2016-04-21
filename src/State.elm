module State (initialState, update) where

import Effects exposing (..)
import Html exposing (Html)
import Types exposing (..)
import Today.Types exposing (..)
import Nav.Types exposing (..)
import String


initialState : ( AppModel, Effects Action )
initialState =
  ( { nav = initialNavModel
    , today = initialTodayModel
    }
  , Effects.none
  )


update : Action -> AppModel -> ( AppModel, Effects Action )
update action model =
  case action of
    _ ->
      ( model, Effects.none )
