# String Conversion Tool (Modules)

This library contains an assortment of string manipulation methods. Manipulations/Conversions include: Encoding, Decoding, Hashing, Encrypting, and Decrypting. This library also includes the String Comparison Module which, using the Jaro Winkler algorithm, displays how far two strings are from being similar to each other in percentage format.

## Basic Usage Example (Encoding/Decoding)
- This example should entail how all of the modules will be used

#### Encoding
```swift
import Encoder

class TestClass {
    
    let text = "Text to encode"
    let encode = Encoder.init(text: text)
    
    print("String \"\(text)\" encoded into binary: \(encode.toBinary())")
}

```

##### Decoding
``` swift
import Decoder

class TestClass {

    let encodedString = "8A8TXZZfyfKBJpR4ynFbLMxcQmKXa"
    let decode = Decoder.init(encodedText: encodedString)
    
    print("Encoded string \"\(encodedString)\" decoded using Base58 is: \(decode.fromBase58())")
}
```

It is quite possibly as simple as that...
