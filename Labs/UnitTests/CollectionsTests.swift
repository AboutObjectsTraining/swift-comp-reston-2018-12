//
//  CollectionsTests.swift
//  UnitTests
//
//  Created by Jonathan Lehr on 12/8/18.
//  Copyright © 2018 About Objects. All rights reserved.
//
import XCTest

@testable import Labs

struct ContactInfo
{
    let phonesInfo = [
        "home": "202-123-4567",
        "work": "516-456-7890",
        "mobile": "914-789-1234",
        "other:": "914-456-7890"
    ]
    
    func filteredPhones(matching: @escaping (String, String) -> Bool) -> [String: String] {
        var matchedPhones = [String: String]()
        for (key, value) in phonesInfo {
            if matching(key, value) {
                matchedPhones[key] = value
            }
        }
        return matchedPhones
    }
}


class CollectionsTests: XCTestCase
{
    let wrappedX = Int("12")
    let foo = Int(exactly: 1.0)
    let wrappedWords: [String?] = [nil, "Apple", nil, "Orange"]
    
    func testCompactMap() {
        print(wrappedWords)
        let words = wrappedWords.compactMap { $0?.uppercased() }
        print(words)
    }
    
    func testArrays() {
        let a = [1, 2, 3]
        var b = a
        b.append(4)
        
        print(a)
        print(b)
        
        a.forEach {
            print($0)
        }
    }
    
    let areaCode = "914"
    
    func testMatchingPhones() {
        let contact = ContactInfo()
        let matchingContacts = contact.filteredPhones { [unowned self] _, value in
            value.hasPrefix(self.areaCode)
        }
        print(matchingContacts)
    }
}
