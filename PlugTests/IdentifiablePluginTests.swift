//
//  IdentifiablePluginTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import XCTest
import Plug

public class IdentifiablePluginTests: XCTestCase {
    func testId_WhenCalled_ShouldReturnIdPluginWasInitializedWith() {
        XCTAssertEqual("123", IdentifiedPlugin(id: "123", wrappedValue: PluginMock()).id)
        XCTAssertEqual("some_id", IdentifiedPlugin(id: "some_id", wrappedValue: PluginMock()).id)
    }
    
    func testPlugin_WhenCalled_ShouldReturnPluginItWasInitializedWith() {
        let mock = PluginMock()
        let sut = IdentifiedPlugin(id: "123", wrappedValue: mock)
        XCTAssertTrue(mock === sut.plugin)
    }
}

