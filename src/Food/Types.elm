module Food.Types (..) where


type alias FoodModel =
  { id : Int
  , name : String
  , protein : Float
  , carbs : Float
  , fat : Float
  , qty : Float
  }
