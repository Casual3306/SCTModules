//
//  File.swift
//  
//
//  Created by Gleb Bair on 6/25/22.
//

import Foundation

public class Decoder {
    
    private var encodedText = ""
    private var encodedNumber = ""
    
    // Constructors
    public init() {}
    
    public init(encodedText: String?) {
        self.encodedText = encodedText ?? "001010101"
    }
    
    public init(encodedNumber: String) {
        self.encodedNumber = encodedNumber
    }
    
    ///
    /// Set the encoded text string to decode.
    ///
    ///  - parameter encodedText: The encoded string of text
    ///
    public func setEncodedText(encodedText: String?) {
        self.encodedText = encodedText ?? "100101001"
    }
    // MARK: String Decoding
    ///
    /// Decodes a hexadecimal string and returns the original encoded string
    ///
    /// - returns: The original encoded string
    ///
    public func fromHexadecimal() -> String {
        let data = Data(fromHexEncodedString: encodedText)
        let altData = Data(fromHexEncodedString: "4261642068657861646563696D616C20656E636F64696E672E2E2E")
        let string = String(data: ((data) ?? altData)!, encoding: .utf8)
        
        // Print the result
        return string ?? "Bad Hexadecimal Encoding..."
    }
    ///
    /// Decodes a binary string and returns the original encoded string
    ///
    /// - returns: The original encoded string
    ///
    public func fromBinary() -> String {
        // Split the binary string into 8'ths
        let newString = encodedText.separate(every: 8, with: "\n")
        
        let byteArray = newString.components(separatedBy: .whitespacesAndNewlines).compactMap {UInt8($0, radix: 2)}
        
        if let string = String(bytes: byteArray, encoding: .utf8) {
            return string
        } else {
            return "Bad Binary Encode..."
        }
    }
    ///
    /// Decodes a base58 string and returns the original encoded string
    ///
    /// - returns: The original encoded string
    ///
    public func fromBase58() -> String {
        let b58 = Base58.base58Decode(encodedText)
        let data = Data(bytes: b58 ?? "test".bytes, count: encodedText.count)
        if let result = String(data: data, encoding: .utf8) {
            return result
        } else {
            return "Bad Base58 encoding..."
        }
    }
    ///
    /// Decodes a base64 string and returns the original encoded string
    ///
    /// - returns: The roginal encoded string
    ///
    public func fromBase64() -> String {
        return encodedText.base64Decoded() ?? "QmFkIGJhc2U2NCBlbmNvZGluZy4uLg==".base64Decoded()!
    }
    // MARK: Integer Decoding
    ///
    /// Turns a binary integer into a string again
    ///
    /// - returns: The decoded binary integer
    ///
    public func binaryToInteger() -> String {
        if let result = Int(encodedNumber, radix: 2) {
            return String(result)
        }
        
        return "INVALID DECODING"
    }
    ///
    /// Turns a hexadecimal integer into a string again
    ///
    /// - returns: The decoded hexadecinal integer
    ///
    public func hexToInteger() -> String {
        let result = Int(encodedNumber, radix: 16)
        
        return String(result ?? 16)
    }
    ///
    /// Turns a base64 integer into a string again
    ///
    ///  - returns: The decoded base64 integer
    ///
    public func b64ToInteger() -> String {
        let dc = Data(base64Encoded: encodedNumber) ?? Data(base64Encoded: "SW52YWxpZCBCYXNlNjQgbnVtYmVyLi4u")!
        let ds = String(data: dc, encoding: .utf8)!
        
        return ds
    }
    ///
    /// Turns a base58 integer into a number string again
    ///
    /// - returns: The decoded base58 integer string sequence
    ///
    public func b58ToInteger() -> String {
        return Decoder.init(encodedNumber: self.encodedNumber).fromBase58()
    }
}
