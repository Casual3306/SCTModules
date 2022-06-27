//
//  File.swift
//  
//
//  Created by Gleb Bair on 6/26/22.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import var CommonCrypto.CC_MD2_DIGEST_LENGTH
import var CommonCrypto.CC_MD4_DIGEST_LENGTH
import var CommonCrypto.CC_SHA1_DIGEST_LENGTH
import var CommonCrypto.CC_SHA224_DIGEST_LENGTH
import var CommonCrypto.CC_SHA256_DIGEST_LENGTH
import var CommonCrypto.CC_SHA384_DIGEST_LENGTH
import var CommonCrypto.CC_SHA512_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import func CommonCrypto.CC_MD2
import func CommonCrypto.CC_MD4
import func CommonCrypto.CC_SHA1
import func CommonCrypto.CC_SHA224
import func CommonCrypto.CC_SHA384
import func CommonCrypto.CC_SHA512
import typealias CommonCrypto.CC_LONG

public class Hashing {
    
    private var textToHash = ""
    
    // Constructors
    public init() {}
    
    public init(textToHash: String?) {
        self.textToHash = textToHash ?? "string to hash"
    }
    ///
    /// Allows the user to set the textToHash to hash
    ///
    /// - parameter textToHash: The textToHash you want hashed
    ///
    public func setTextToHash(textToHash: String?) {
        self.textToHash = textToHash ?? "string to hash"
    }
    ///
    /// Hash the original string using the MD2 Algorithm
    ///
    /// - returns: The hashed original string (original string data is lost)
    ///
    public func toMD2() -> Data {
        let length = Int(CC_MD2_DIGEST_LENGTH)
        let messageData = textToHash.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD2(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    ///
    /// Hash the original string using the MD4 Algorithm
    ///
    /// - returns: The hashed original string (original string data is lost)
    ///
    public func toMD4() -> Data {
        let length = Int(CC_MD4_DIGEST_LENGTH)
        let messageData = textToHash.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD4(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    ///
    /// Hash the original string using the MD5 Algorithm
    ///
    /// - returns: The hashed original string (original string data is lost)
    ///
    public func toMD5() -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = textToHash.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    ///
    /// Hash the original string using the SHA1 Algorithm
    ///
    /// - returns: The hashed original string (original string data is lost)
    ///
    public func toSHA1() -> Data {
        let length = Int(CC_SHA1_DIGEST_LENGTH)
        let messageData = textToHash.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_SHA1(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    ///
    /// Hash the original string using the SHA-224 Algorithm
    ///
    /// - returns: The hashed original string (original string data is lost)
    ///
    public func toSHA224() -> Data {
        let length = Int(CC_SHA224_DIGEST_LENGTH)
        let messageData = textToHash.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_SHA224(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    ///
    /// Hash the original string using the SHA-256 Algorithm
    ///
    /// - returns: The hashed original string (original string data is lost)
    ///
    public func toSHA256() -> Data {
        let length = Int(CC_SHA256_DIGEST_LENGTH)
        let messageData = textToHash.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_SHA224(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    ///
    /// Hash the original string using the SHA-384 Algorithm
    ///
    /// - returns: The hashed original string (original string data is lost)
    ///
    public func toSHA384() -> Data {
        let length = Int(CC_SHA384_DIGEST_LENGTH)
        let messageData = textToHash.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_SHA384(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    ///
    /// Hash the original string using the SHA-512 Algorithm
    ///
    /// - returns: The hashed original string (original string data is lost)
    ///
    public func toSHA512() -> Data {
        let length = Int(CC_SHA512_DIGEST_LENGTH)
        let messageData = textToHash.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_SHA512(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
}
