//
//  InvertedRuleTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public class InvertedRuleTests: XCTestCase {
    func testResolve_WhenInitializedWithTrue_ShouldReturnFalse() {
        XCTAssertFalse(AtomRule(true).inverted().resolve(with: ResolvingContextMock()))
    }
    
    func testResolve_WhenInitializedWithFalse_ShouldReturnTrue() {
        XCTAssertTrue(AtomRule(false).inverted().resolve(with: ResolvingContextMock()))
    }
}
