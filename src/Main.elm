module Main where

-- import Graphics.Element exposing (..)
import Debug
--import Basics
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String

type alias Food =
  { id: Int
  , name: String
  , protein: Int
  , carbs: Int
  , fat: Int
  , qty: Int
  }

type alias Model =
  { previousFoods: List Food
  , currentFood: Food
  }

type Action
  = NoOp
  | Add
  | RemovePreviousFood Int
  | UpdateName String
  | UpdateProtein String
  | UpdateCarbs String
  | UpdateFat String
  | UpdateQty String

inbox : Signal.Mailbox Action
inbox =
  Signal.mailbox NoOp

actions : Signal Action
actions =
  inbox.signal

model : Signal Model
model =
  Signal.foldp update initialModel actions

initialModel : Model
initialModel =
  { previousFoods = [
    { id = 1, name = "Chicken", protein = 123, carbs = 12, fat = 5, qty = 10 }
  ]
  , currentFood = { id = 2, name = "", protein = 0, carbs = 0, fat = 0, qty = 10 }
  }

update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model
    Add ->
      { model | previousFoods = model.currentFood :: model.previousFoods }
    RemovePreviousFood foodId ->
      let
        -- Filter out the food with the id in foodId
        foods = List.filter (\a -> a.id /= foodId) model.previousFoods
      in
        { model | previousFoods = foods }
    UpdateName str ->
      let
        currentFood = model.currentFood
        updatedFood = { currentFood | name = str }
      in
        { model | currentFood = updatedFood }
    UpdateProtein str ->
      let
        strAsInt = String.toInt str |> Result.withDefault 0
        currentFood = model.currentFood
        updatedFood = { currentFood | protein = strAsInt }
      in
        { model | currentFood = updatedFood }
    UpdateCarbs str ->
      let
        strAsInt = String.toInt str |> Result.withDefault 0
        currentFood = model.currentFood
        updatedFood = { currentFood | carbs = strAsInt }
      in
        { model | currentFood = updatedFood }
    UpdateFat str ->
      let
        strAsInt = String.toInt str |> Result.withDefault 0
        currentFood = model.currentFood
        updatedFood = { currentFood | fat = strAsInt }
      in
        { model | currentFood = updatedFood }
    UpdateQty str ->
      let
        strAsInt = String.toInt str |> Result.withDefault 0
        currentFood = model.currentFood
        updatedFood = { currentFood | qty = strAsInt }
      in
        { model | currentFood = updatedFood }

view : Signal.Address Action -> Model -> Html
view address model =
  div [ class "main-view" ] [
    div [ class "name-input-wrapper" ] [
      input [
        class "name-input"
        , type' "text"
        , placeholder "Name"
        , autofocus True
        , onInput address UpdateName
       ] []
      , input [ class "qty-input", type' "text", placeholder "Qty", onInput address UpdateQty ] []
    ]
    , div [ class "macro-input-wrapper" ] [
      input [ class "macro-input", type' "text", placeholder "Protein", onInput address UpdateProtein ] []
      , input [ class "macro-input", type' "text", placeholder "Carbs", onInput address UpdateCarbs ] []
      , input [ class "macro-input", type' "text", placeholder "Fat", onInput address UpdateFat ] []
    ]
    , div [ class "submit-wrapper" ] [
      button [ class "submit-btn", onClick address Add ] [ text "Add" ]
    ]
    , div [ class "todat-total" ] [
      span [] [ text "Total:" ]
      , span [] [ totalCalories model |> toString |> text ]
    ]
    , div [ class "today-list" ] [
      p [] [ previousFoodsList address model.previousFoods ]
    ]
  ]

totalCalories : Model -> Int
totalCalories model =
  List.map kCal model.previousFoods |> List.sum

onInput : Signal.Address Action -> (String -> Action) -> Attribute
onInput address action =
  on "input" targetValue (\value -> Signal.message address (action value))

-- Returns a list of foods
previousFoodsList : Signal.Address Action -> List Food -> Html
previousFoodsList address foods =
  table [] (List.map (previousFoodItem address) foods)

-- Returns a food item
previousFoodItem : Signal.Address Action -> Food -> Html
previousFoodItem address food =
  tr [] [
    td [] [ text food.name ]
    , td [] [ text (toString food.protein) ]
    , td [] [ text (toString food.carbs) ]
    , td [] [ text (toString food.fat) ]
    , td [] [ text (toString (kCal food)) ]
    , td [] [
      a [ onClick address (RemovePreviousFood food.id) ] [ text "Remove" ]
    ]
  ]

kCal : Food -> Int
kCal food =
  food.qty * food.protein * 4 + food.carbs * 4 + food.fat * 9

main : Signal Html
main =
  Signal.map (view inbox.address) model
