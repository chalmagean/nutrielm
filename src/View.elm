module View (..) where

import Effects exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Nav.View exposing (..)
import Today.View exposing (..)


view : Signal.Address Action -> AppModel -> Html
view address model =
  div
    [ class "main-view" ]
    [ navView address model.nav
    , todayListView address model.today
      --, div
      --    [ class "today-total" ]
      --    [ span [] [ text "Total:" ]
      --    , span [] [ totalCalories model |> toString |> text ]
      --    ]
      --, div
      --    [ class "today-list" ]
      --    [ p [] [ previousFoodsList address model.previousFoods ]
      --    ]
    ]
