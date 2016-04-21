module Today.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Utils exposing (..)
import Nav.Types exposing (..)
import Today.Types exposing (..)
import Food.Types exposing (..)


todayListView : Signal.Address Action -> TodayModel -> Html
todayListView address model =
  div
    [ class "today-list" ]
    [ text "List" ]



-- Returns a list of foods


previousFoodsList : Signal.Address Action -> List FoodModel -> Html
previousFoodsList address foods =
  table [] (List.map (previousFoodItem address) foods)



-- Returns a food item


previousFoodItem : Signal.Address Action -> FoodModel -> Html
previousFoodItem address food =
  tr
    []
    [ td [] [ text food.name ]
    , td [] [ text (toString food.protein) ]
    , td [] [ text (toString food.carbs) ]
    , td [] [ text (toString food.fat) ]
    , td [] [ text (toString (kCal food)) ]
    , td
        []
        [ a [ onClick address (RemovePreviousFood food.id) ] [ text "Remove" ]
        ]
    ]
