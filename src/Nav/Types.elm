module Nav.Types (..) where


type alias NavModel =
  { title : String }


initialNavModel : NavModel
initialNavModel =
  { title = "Today" }
