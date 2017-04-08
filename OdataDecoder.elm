module OdataDecoder exposing ( Odata, Person, decodePerson, decodeOdata
                             , odata, person
                             )

import Json.Decode as JD exposing ( Decoder, string, int, nullable )
import Json.Decode.Pipeline exposing ( decode, required, optional )

type alias Odata =
    { metadata : String
    , value : List Person
    }

type alias Person =
    { id : Int
    , fullName : String
    , dob : String
    , email : String
    , mobilePhoneNumber : String
    , citizenship : Maybe String
    , idType : Maybe String
    , idNumber : Maybe String
    , highestEducation : Maybe String
    , salaryRange : Maybe String
    }

decodeOdata : String -> Result String Odata
decodeOdata string =
    JD.decodeString odataDecoder string

odataDecoder : Decoder Odata
odataDecoder =
    decode Odata
        |> required "odata.metadata" string
        |> required "value" (JD.list personDecoder)

decodePerson : String -> Result String Person
decodePerson string =
    JD.decodeString personDecoder string

personDecoder : Decoder Person
personDecoder =
    decode Person
        |> required "id" int
        |> required "fullName" string
        |> required "dob" string
        |> required "email" string
        |> required "mobilePhoneNumber" string
        |> required "citizenship" (nullable string)
        |> required "idType" (nullable string)
        |> required "idNumber" (nullable string)
        |> required "highestEducation" (nullable string)
        |> required "salaryRange" (nullable string)

person : String
person = """
{
"id":2,"fullName":"Jason","dob":"2014-02-10T00:00:00","email":"jason@gmail.com","mobilePhoneNumber":"98091234","citizenship":null,"idType":null,"idNumber":null,"highestEducation":null,"salaryRange":null
}
    """

odata : String
odata = """
{
"odata.metadata":"http://localhost:52134/odata/$metadata#Students","value":[
{
"id":2,"fullName":"Jason","dob":"2014-02-10T00:00:00","email":"jason@gmail.com","mobilePhoneNumber":"98091234","citizenship":null,"idType":null,"idNumber":null,"highestEducation":null,"salaryRange":null
},{
"id":3,"fullName":"Bob","dob":"1997-12-25T00:00:00","email":"bob@gmail.com","mobilePhoneNumber":"98088234","citizenship":null,"idType":null,"idNumber":null,"highestEducation":null,"salaryRange":null
},{
"id":4,"fullName":"John","dob":"2001-02-10T00:00:00","email":"john@gmail.com","mobilePhoneNumber":"89091234","citizenship":null,"idType":null,"idNumber":null,"highestEducation":null,"salaryRange":null
}
]
}
    """
