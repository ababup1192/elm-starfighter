module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- ---------------------------
-- MODEL
-- ---------------------------


type alias Model =
    { logoSize : Float
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { logoSize = 10.0 }, Cmd.none )



-- ---------------------------
-- UPDATE
-- ---------------------------


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        { logoSize } =
            model
    in
    case msg of
        Increment ->
            ( { model | logoSize = logoSize + 0.2 }, Cmd.none )

        Decrement ->
            ( { model | logoSize = logoSize - 0.2 }, Cmd.none )



-- ---------------------------
-- VIEW
-- ---------------------------


view : Model -> Browser.Document Msg
view model =
    let
        { logoSize } =
            model
    in
    { title = "Elm 0.19 starter"
    , body =
        [ header [ class "site-header" ]
            [ h1 [] [ text "Logo counter" ]
            ]
        , main_ []
            [ img
                [ src "assets/images/Elm_logo.png"
                , style "width" <| String.fromFloat logoSize ++ "em"
                , style "height" <| String.fromFloat logoSize ++ "em"
                ]
                []
            , article []
                [ button [ onClick Increment ] [ text "+" ]
                , button [ onClick Decrement ] [ text "-" ]
                ]
            ]
        ]
    }



-- ---------------------------
-- MAIN
-- ---------------------------


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
