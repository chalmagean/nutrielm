module Types (..) where

import Nav.Types exposing (..)
import Today.Types exposing (..)


type Action
  = NoOp
  | Add
  | RemovePreviousFood Int
  | UpdateName String
  | UpdateProtein String
  | UpdateCarbs String
  | UpdateFat String
  | UpdateQty String


type alias AppModel =
  { today : TodayModel
  , nav : NavModel
  }
