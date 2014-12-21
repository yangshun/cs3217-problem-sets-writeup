//
//  String+CryptographyTests.swift
//  GraphADT
//
//  Copyright (c) 2014 NUS CS3217. All rights reserved.
//

import XCTest


class StringCryptographyTests : XCTestCase {
    
    func testEncrypt_simpleString() {
        let str = "HELLO WORLD"
        let encryptedStr = "HELOROLDL **W"
        
        XCTAssertEqual(str.encrypt(2), encryptedStr, "Encrypted string is not correct")
    }
    
    func testDecrypt_simpleString() {
        let str = "HELOROLDL **W"
        let decryptedStr = "HELLO WORLD"
        
        XCTAssertEqual(str.decrypt(2), decryptedStr, "Decrypted string is not correct")
    }
    
    func testBreadthFirstToTreeWithNumberOfChildren_BFStoTreeThenBFSToString_sameString() {
        let str = "HELLO WORLD"
        let twiceAppliedStr = str.breadthFirstToTreeWithNumberOfChildren(5).breadthFirstToString()
        
        XCTAssertEqual(twiceAppliedStr, str, "BFS to tree and then BFS to string should return the same string")
    }
    
    func testDepthFirstToTreeWithNumberOfChildren_DFStoTreeThenDFSToString_sameString() {
        let str = "HELLO WORLD"
        let twiceAppliedStr = str.depthFirstToTreeWithNumberOfChildren(5).depthFirstToString()
        
        XCTAssertEqual(twiceAppliedStr, str, "BFS to tree and then BFS to string should return the same string")
    }
}
