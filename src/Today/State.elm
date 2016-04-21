module Today.State (..) where


initialTodayModel : TodayModel
initialTodayModel =
  { today = Nothing, past = Nothing }


update : Action -> AppModel -> ( AppModel, Effects Action )
update action model =
  case action of
    Add ->
      { model | previousFoods = model.currentFood :: model.previousFoods }

    RemovePreviousFood foodId ->
      let
        -- Filter out the food with the id in foodId
        foods =
          List.filter (\a -> a.id /= foodId) model.previousFoods
      in
        { model | previousFoods = foods }

    UpdateName str ->
      let
        currentFood =
          model.currentFood

        updatedFood =
          { currentFood | name = str }
      in
        { model | currentFood = updatedFood }

    UpdateProtein str ->
      let
        strAsFloat =
          String.toFloat str |> Result.withDefault 0

        currentFood =
          model.currentFood

        updatedFood =
          { currentFood | protein = strAsFloat }
      in
        { model | currentFood = updatedFood }

    UpdateCarbs str ->
      let
        strAsFloat =
          String.toFloat str |> Result.withDefault 0

        currentFood =
          model.currentFood

        updatedFood =
          { currentFood | carbs = strAsFloat }
      in
        { model | currentFood = updatedFood }

    UpdateFat str ->
      let
        strAsFloat =
          String.toFloat str |> Result.withDefault 0

        currentFood =
          model.currentFood

        updatedFood =
          { currentFood | fat = strAsFloat }
      in
        { model | currentFood = updatedFood }

    UpdateQty str ->
      let
        strAsFloat =
          String.toFloat str |> Result.withDefault 0

        currentFood =
          model.currentFood

        updatedFood =
          { currentFood | qty = strAsFloat }
      in
        { model | currentFood = updatedFood }

    _ ->
      model
