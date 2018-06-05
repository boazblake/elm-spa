module Login.Models exposing (Model, init)

type alias Model =
  { user_name : String
  , password : String
  , password_check : String
  }
  
init =
  { user_name = ""
  , password = ""
  , password_check = ""
  }

