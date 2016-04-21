module FoodForm (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)
import Actions exposing (..)


addFoodForm : Signal.Address Action -> AppModel -> Html
addFoodForm address model =
  div
    [ class "food-form" ]
    [ div
        [ class "name-input-wrapper" ]
        [ input
            [ class "name-input"
            , type' "text"
            , placeholder "Name"
            , autofocus True
            , onInput address UpdateName
            ]
            []
        , input [ class "qty-input", type' "text", placeholder "Qty", onInput address UpdateQty ] []
        ]
    , div
        [ class "macro-input-wrapper" ]
        [ input [ class "macro-input", type' "text", placeholder "Protein", onInput address UpdateProtein ] []
        , input [ class "macro-input", type' "text", placeholder "Carbs", onInput address UpdateCarbs ] []
        , input [ class "macro-input", type' "text", placeholder "Fat", onInput address UpdateFat ] []
        ]
    , div
        [ class "submit-wrapper" ]
        [ button [ class "submit-btn", onClick address Add ] [ text "Add" ]
        ]
    ]


onInput : Signal.Address Action -> (String -> Action) -> Attribute
onInput address action =
  on "input" targetValue (\value -> Signal.message address (action value))
