//
//  File.swift
//  
//
//  Created by Gleb Bair on 6/25/22.
//

import Foundation

public class Encoder {
    // Data variables
    private var text = ""
    private var integer = 0
    
    // Constructors
    public init() {}
    
    public init(text: String?) {
        self.text = text ?? "NIL"
    }
    
    public init(integer: Int?) {
        self.integer = integer ?? 0
    }
    
    ///
    /// Sets the text string to encode. If no text is given, the default text will be "NIL"
    ///
    /// - parameter text: The string of text to encode
    ///
    public func setText(text: String?) {
        self.text = text ?? "NIL"
    }
    // MARK: String Encoding
    ///
    /// Encodes a string of text using the Hexadecimal method. This method will return the encoded hexadecimal string
    ///
    /// - returns: The text string as hexadecimal
    ///
    public func toHexadecimal() -> String {
        let data = Data(self.text.utf8)
        let hxString:String = data.map{String(format: "%02x", $0)}.joined()
        
        // Display the resulting encoding
        return String(hxString)
    }
    ///
    /// Encodes a string of text using the Binary method. This method will return the encoded binary string
    ///
    /// - returns: The text string as binary
    ///
    public func toBinary() -> String {
        // var byte = string.utf8.count
        var bytes:[UInt8] = []
        var units:[String] = []
        var whole = ""
        
        for char in self.text.utf8 {
            bytes += [char]
        }
        
        // Output the result
        for x in toBinaryStringArray(array: bytes) {
            units.append(x)
            whole = units.joined(separator: "")
        }
        
        return whole
    }
    ///
    /// Encodes a string of text using the Base58 method. This method will return the encoded base58 string
    ///
    /// - returns: The text string as base58
    ///
    public func toBase58() -> String {
        let b58 = Base58.base58Encode(self.text.bytes)
        return b58
    }
    ///
    /// Encodes a string of text using the Base64 method. This method will return the base64 string
    ///
    /// - returns: The text string as base64
    ///
    public func toBase64() -> String {
        let data = self.text.toBase64()
                
        return String(data)
    }
    // MARK: Integer Encoding
    ///
    /// Encode a number into binary.
    ///
    /// - returns: The number in binary form
    ///
    public func intToBinary() -> String {
        if integer >= 99999 {
            return String(Int64(integer).binaryDescription)
        } else if integer < 99999 {
            return String(Int16(integer).binaryDescription)
        }
        
        return "INVALID INTEGER CONVERSION"
    }
    ///
    /// Encode a number into hexadecimal
    ///
    /// - returns: The number in hexadecimal form
    ///
    public func intToHexadecimal() -> String {
        return String(integer, radix: 16)
    }
    ///
    /// Encode a number into base64
    ///
    /// - returns: The number in base64 form
    ///
    public func intToBase64() -> String {
        return String(integer).toBase64()
    }
    ///
    /// Encode a number into base58
    ///
    /// - returns: The number in base58 form
    ///
    public func intToBase58() -> String {
        return Encoder.init(text: String(Int(integer))).toBase58()
    }
    
    // MARK: Meta sub-methods
    private func toBinaryStringArray(array:[UInt8]) -> [String] {
        var result:[String] = []
        
        for e in array {
            let bin = byteToBinaryString(byte: e)
            result.append(bin)
        }
        
        return result;
    }

    private func byteToBinaryString(byte:UInt8) -> String {
        var result = String(byte, radix: 2)
        
        while result.count < 8 {
            result = "0" + result
        }
        
        return result;
    }
}
