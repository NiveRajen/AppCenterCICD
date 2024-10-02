//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Nivedha Rajendran on 02.10.24.
//  Copyright © 2024 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

final class MinutesTests: XCTestCase {

    var entryTest: Entry!

    override func setUpWithError() throws {
        entryTest = Entry("Title", "Content")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        entryTest = nil
    }

   func testSerialization() throws {
       let serializedData = FileEntryStore.serialize(entryTest)
       let entry = FileEntryStore.deserialize(serializedData!)
       
       XCTAssertEqual(entry?.title, "Title", "Title does not match")
       XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }

}
