A little JSON decoder for Setiaman Lee.

To run it.

    git clone git@github.com:billstclair/elm-odata-decoder.git
    cd elm-odata-decoder
    elm repl
    
    -- Inside the repl
    import OdataDecoder exposing (..)
    odata                -- Look at the string to be decoded
    decodeOdata odata    -- Decode it
    
I'm using `NoRedInk/elm-decode-pipeline`, so if you use this in your own project, you'll need to:

    elm package install NoRedInk/elm-decode-pipeline

Bill St. Clair &lt;<billstclair@gmail.com>&gt;  
8 April 2017
