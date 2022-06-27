//
//  File.swift
//  
//
//  Created by Gleb Bair on 6/25/22.
//

import Foundation

public class AESDecryptor {
    
    private var encryptedText = ""
    private var decryptMode = 128
    
    // Constructors
    public init() {}
    
    public init(encryptedText: String?, decryptMode: Int?) {
        self.encryptedText = encryptedText ?? ""
        self.decryptMode = decryptMode ?? 128
    }
    
    ///
    /// Allows the user to set the encrypted (AES) string to decrypt
    ///
    /// - parameter encryptedText: The (AES) encrypted text to decrypt
    ///
    public func setEncryptedText(encryptedText: String?) {
        self.encryptedText = encryptedText ?? ""
    }
    ///
    /// The decrypt mode integer (128 or 256 Bit) works similar to its encryption counterpart. To decrypt, one must determine whether they are
    /// decrypting a 128 or 256 Bit cipher. This allows the user to set that cipher mode integer (128 or 256 Bit).
    ///
    /// - parameter decryptMode: Should the encrypted text string use a 128 or 256 Bit decryption cipher?
    ///
    public func setDecryptMode(decryptMode: Int?) {
        self.decryptMode = decryptMode ?? 128
    }
    ///
    /// Main decryption method. The user must set the Key and IV string. As usual, the decrypt mode cipher determines how long the key string must be character wise.
    /// If the use wants to decrypt using the 128 Bit cipher the Key string must be 16 characters in length. If the user wants to decrypt using the 256 Bit cipher, then the
    /// Key string must be 32 characters in length. The IV string length needs to stay at 16 characters.
    ///
    /// - parameter key: Your secret key string that you used to encrypt the original string
    /// - parameter iv: Your initialization vector used to encrypt the original string
    ///
    public func decryptString(key: String, iv: String) -> String {
        
        switch decryptMode {
        case 128:
            if key.count == 16 {
                let decrypt = decryptString(key: key, iv: iv)
                return decrypt
            } else {
                return "Invalid Key length. For 128 Bit decryption the Key length must be 16 characters long."
            }
            
        case 256:
            if key.count == 32 {
                let decrypt = decryptString(key: key, iv: iv)
                return decrypt
            } else {
                return "Invalid Key length. For 256 Bit decryption the Key length must be 32 characters long."
            }
            
        default:
            break
        }
        
        return "Invalid decryption signature. Check your Key and or IV."
    }
}
