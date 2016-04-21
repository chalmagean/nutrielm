module Today.Types (..) where

import Food.Types exposing (..)


type alias TodayModel =
  { today : Maybe (List FoodModel)
  , past : Maybe (List FoodModel)
  }


initialTodayModel : TodayModel
initialTodayModel =
  { today = Nothing, past = Nothing }
