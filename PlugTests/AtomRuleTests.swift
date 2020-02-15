//
//  AtomRuleTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public class AtomRuleTests: XCTestCase {
    func testResolve_WhenInitializedWithTrue_ShouldReturnTrue() {
        XCTAssertTrue(AtomRule(true).resolve(with: ResolvingContextMock()))
    }
    
    func testResolve_WhenInitializedWithFalse_ShouldReturnFalse() {
        XCTAssertFalse(AtomRule(false).resolve(with: ResolvingContextMock()))
    }
}
