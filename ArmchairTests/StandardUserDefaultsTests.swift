//
//  StandardUserDefaultsTests.swift
//  Armchair
//
//  Created by ShopBack on 2/27/19.
//  Copyright © 2019 Armchair. All rights reserved.
//

import XCTest
@testable import Armchair

class StandardUserDefaultsTests: XCTestCase {
    let testKey = "testKey"
    var sut: StandardUserDefaults!

    override func setUp() {
        sut = StandardUserDefaults()
    }

    override func tearDown() {
        sut.removeObjectForKey(testKey)
    }

    func testSetAndGetInteger() {
        //Given:
        let expected: Int = 123

        //When:
        sut.setInteger(expected, forKey: testKey)
        let actual = sut.integerForKey(testKey)

        //Then:
        XCTAssertEqual(actual, expected)
    }

    func testSetAndGetDouble() {
        //Given:
        let expected: Double = 123.0

        //When:
        sut.setDouble(expected, forKey: testKey)
        let actual = sut.doubleForKey(testKey)

        //Then:
        XCTAssertEqual(actual, expected)
    }

    func testSetAndGetBool() {
        //Given:
        let expected: Bool = true

        //When:
        sut.setBool(expected, forKey: testKey)
        let actual = sut.boolForKey(testKey)

        //Then:
        XCTAssertEqual(actual, expected)
    }

    func testSetAndGetString() {
        //Given:
        let expected: String = "testing string"

        //When:
        sut.setObject(expected as AnyObject, forKey: testKey)
        let actual = sut.stringForKey(testKey)

        //Then:
        XCTAssertEqual(actual, expected)
    }

    func testRemoveObjectForKey() {
        //Given:
        let expected: String = "testing string"

        //When:
        sut.setObject(expected as AnyObject, forKey: testKey)
        sut.removeObjectForKey(testKey)
        let actual = sut.stringForKey(testKey)

        //Then:
        XCTAssertNil(actual)
    }

    func testShouldBeDifferentWithStandard() {
        //Given:
        let expected1: String = "expected1"
        let expected2: String = "expected2"

        //When:
        sut.setObject(expected1 as AnyObject, forKey: testKey)
        UserDefaults.standard.set(expected2, forKey: testKey)

        let actual1 = sut.stringForKey(testKey)
        let actual2 = UserDefaults.standard.string(forKey: testKey)

        //Then:
        XCTAssertEqual(actual1, expected1)
        XCTAssertEqual(actual2, expected2)
    }

    func testSetAndGetDate() {
        //Given:
        let expected: Date = Date()

        //When:
        sut.setObject(expected as AnyObject, forKey: testKey)
        let actual = sut.objectForKey(testKey) as? Date

        //Then:
        XCTAssertEqual(actual?.timeIntervalSince1970, expected.timeIntervalSince1970)
    }

}
