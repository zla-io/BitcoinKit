//
//  Base58Tests.swift
//  BitcoinKitTests
//
//  Created by Takaoka on 2018/07/07.
//  Copyright © 2018年 Kishikawa Katsumi. All rights reserved.
//

import XCTest
@testable import BitcoinKit

class Base58Tests: XCTestCase {
    
    func testAll() {
        XCTAssertNil(Base58.decode(""))
        XCTAssertNil(Base58.decode(" "))
        XCTAssertNil(Base58.decode("lLoO"))
        XCTAssertNil(Base58.decode("l"))
        XCTAssertNil(Base58.decode("O"))
        XCTAssertNil(Base58.decode("öまи"))
        
        HexEncodesToBase58(hex: "61", base58: "2g")
        HexEncodesToBase58(hex: "626262", base58: "a3gV")
        HexEncodesToBase58(hex: "636363", base58: "aPEr")
        HexEncodesToBase58(hex: "73696d706c792061206c6f6e6720737472696e67", base58: "2cFupjhnEsSn59qHXstmK2ffpLv2")
        HexEncodesToBase58(hex: "00eb15231dfceb60925886b67d065299925915aeb172c06647", base58: "1NS17iag9jJgTHD1VXjvLCEnZuQ3rJDE9L")
        HexEncodesToBase58(hex: "516b6fcd0f", base58: "ABnLTmg")
        HexEncodesToBase58(hex: "bf4f89001e670274dd", base58: "3SEo3LWLoPntC")
        HexEncodesToBase58(hex: "572e4794", base58: "3EFU7m")
        HexEncodesToBase58(hex: "ecac89cad93923c02321", base58: "EJDM8drfXA6uyA")
        HexEncodesToBase58(hex: "10c8511e", base58: "Rt5zm")
        HexEncodesToBase58(hex: "00000000000000000000", base58: "1111111111")
        
        
    }
    
    func HexEncodesToBase58(hex: String, base58: String) {
        //Encode
        let data = Data(hex: hex)!
        XCTAssertEqual(Base58.encode(data), base58)
        //Decode
        XCTAssertEqual(Base58.decode(base58)!.hex, hex)
    }
}
