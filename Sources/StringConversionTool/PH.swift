//
//  File.swift
//  
//
//  Created by Gleb Bair on 6/25/22.
//

import Foundation
import CryptoSwift

extension String {
    func appendLineToURL(fileURL: URL) throws {
        try (self + "\n").appendToURL(fileURL: fileURL)
     }

     func appendToURL(fileURL: URL) throws {
         let data = self.data(using: String.Encoding.utf8)!
         try data.append(fileURL: fileURL)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    func removeWhitespace(char: String) -> String {
        return self.replace(string: char, replacement: "")
    }
    
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
    
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func aesEncrypt(key: String, iv: String) throws -> String{
        if (iv.count == 16) {
            let data = self.data(using: String.Encoding.utf8)
            let enc = try! AES(key: key, iv: iv, padding: .pkcs7).encrypt([UInt8](data!))
            // let enc = try AES(key: key, iv: iv, blockMode: CBC()).encrypt(data!.arrayOfBytes(), padding: PKCS7())
            let encData = NSData(bytes: enc, length: Int(enc.count))
            let base64String: String = encData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0));
            let result = String(base64String)
            return result
        } else {
            return "Invalid IV String..."
        }
    }

    func aesDecrypt(key: String, iv: String) throws -> String {
        let data = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0))
        let dec = try! AES(key: key, iv: iv, padding: .pkcs7).decrypt([UInt8](data!))
        let decData = NSData(bytes: dec, length: Int(dec.count))
        let result = String(data: decData as Data, encoding: String.Encoding.utf8)
        return String(result ?? "Decryption error. Please check your key (32 characters) and Initialization Vector [IV] (16 characters)...")
    }
    
    func isValidURL() -> Bool {
        guard !contains("..") else { return false }

        let urlStart = "((http|https)://)?([(w|W)]{3}+\\.)?"
        let urlEnd = "\\.+[A-Za-z]{2,3}+(\\.)?+(/(.)*)?"
        let regex = (urlStart + "+(.)+" + urlEnd)

        let testValue = NSPredicate(format:"SELF MATCHES %@", regex)
        return testValue.evaluate(with: trimmingCharacters(in: .whitespaces))
    }
    
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Data {
    func append(fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        }
        else {
            try write(to: fileURL, options: .atomic)
        }
    }
    
    // From http://stackoverflow.com/a/40278391:
    init?(fromHexEncodedString string: String) {

        // Convert 0 ... 9, a ... f, A ...F to their decimal value,
        // return nil for all other input characters
        func decodeNibble(u: UInt16) -> UInt8? {
            switch(u) {
            case 0x30 ... 0x39:
                return UInt8(u - 0x30)
            case 0x41 ... 0x46:
                return UInt8(u - 0x41 + 10)
            case 0x61 ... 0x66:
                return UInt8(u - 0x61 + 10)
            default:
                return nil
            }
        }

        self.init(capacity: string.utf16.count/2)
        var even = true
        var byte: UInt8 = 0
        for c in string.utf16 {
            guard let val = decodeNibble(u: c) else { return nil }
            if even {
                byte = val << 4
            } else {
                byte += val
                self.append(byte)
            }
            even = !even
        }
        guard even else { return nil }
    }
}

extension StringProtocol {
    var data: Data { .init(utf8) }
    var bytes: [UInt8] { .init(utf8) }
}
