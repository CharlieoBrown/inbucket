module Data.MessageHeader exposing (MessageHeader, decoder)

import Data.Date exposing (date)
import Date exposing (Date)
import Json.Decode as Decode exposing (..)
import Json.Decode.Pipeline exposing (..)


type alias MessageHeader =
    { mailbox : String
    , id : String
    , from : String
    , to : List String
    , subject : String
    , date : Date
    , size : Int
    , seen : Bool
    }


decoder : Decoder MessageHeader
decoder =
    decode MessageHeader
        |> required "mailbox" string
        |> required "id" string
        |> optional "from" string ""
        |> required "to" (list string)
        |> optional "subject" string ""
        |> required "date" date
        |> required "size" int
        |> required "seen" bool
