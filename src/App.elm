module App (main) where

import Effects exposing (Never)
import Html exposing (Html)
import StartApp exposing (..)
import Task exposing (Task)
import State
import Types
import View


app : App Types.AppModel
app =
  StartApp.start
    { init = State.initialState
    , update = State.update
    , view = View.view
    , inputs = []
    }


main : Signal Html
main =
  app.html
