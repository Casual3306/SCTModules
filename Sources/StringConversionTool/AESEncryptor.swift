//
//  File.swift
//  
//
//  Created by Gleb Bair on 6/25/22.
//

import Foundation

public class AESEncryptor {
    
    private var stringToEncrypt = ""
    private var encryptMode = 128
    
    // Constructors
    public init() {}
    
    public init(stringToEncrypt: String?, encryptMode: Int?) {
        self.stringToEncrypt = stringToEncrypt ?? "test string"
        self.encryptMode = encryptMode ?? 128
    }
    
    ///
    /// Allows the user to set whatever string they want to encrypt.
    ///
    /// - parameter stringToEncrypt: The string you want encrypted
    ///
    public func setStringToEncrypt(stringToEncrypt: String?) {
        self.stringToEncrypt = stringToEncrypt ?? "test string"
    }
    ///
    /// Allows the user to set the MODE of encryption. The mode can consist of 128 or 256 strengths.
    ///
    /// - parameter encryptMode: Should the string be encrypted using 128 or 256 Bit AES?
    ///
    public func setEncryptMode(encryptMode: Int?) {
        self.encryptMode = encryptMode ?? 128
    }
    ///
    /// Main encryption module. Use this once you have set the string to encrypt and the encrypt mode level. The user will have to set a custom
    /// Key and IV strings. For 128 Bit AES, the Key and IV are both 16 characters in length. But, for 256 Bit AES, the Key is 32 Characters
    /// while the IV remains 16 characters.
    ///
    /// - parameter key: The secret key string.
    /// - parameter iv: Your initialization vector
    ///
    public func encryptString(key: String?, iv: String?) -> String {
        
        switch encryptMode {
        case 128:
            let k = key ?? "Sd12vBNga2ASvba1"
            let i = iv ?? "sFgHjk123ASbnab1"
            
            let encrypted = encryptString(key: k, iv: i)
            return encrypted
            
        case 256:
            let k = key ?? "Sd12vBNga2ASvba1asfASBn123bAsb12"
            let i = iv ?? "sFgHjk123ASbnab1"
            
            let encrypted = encryptString(key: k, iv: i)
            return encrypted
            
        default:
            break
        }
        
        return "Faulty encryption details..."
    }
}
