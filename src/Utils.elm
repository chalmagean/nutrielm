module Utils (..) where

import Food.Types exposing (..)


totalCalories : List FoodModel -> Int
totalCalories foods =
  List.map kCal foods |> List.sum


kCal : FoodModel -> Int
kCal food =
  food.qty
    / 100
    * food.protein
    * 4
    + food.carbs
    * 4
    + food.fat
    * 9
    |> ceiling
