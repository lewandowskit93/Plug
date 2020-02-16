//
//  AnyOfRuleTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public class AnyOfRuleTests: XCTestCase {
    func testResolve_WhenAllRulesAreFalse_ShouldReturnFalse() {
        let sut = AnyOfRule<ResolvingContextMock>([AtomRule(false).any(), AtomRule(false).any()])
        XCTAssertFalse(sut.resolve(with: ResolvingContextMock()))
    }
    
    func testResolve_WhenOneRuleIsTrue_ShouldReturnTrue() {
        let sut = AnyOfRule<ResolvingContextMock>([AtomRule(true).any(), AtomRule(false).any()])
        XCTAssertTrue(sut.resolve(with: ResolvingContextMock()))
    }
    
    func testResolve_WhenAllRulesAreTrue_ShouldReturnTrue() {
        let sut = AnyOfRule<ResolvingContextMock>([AtomRule(true).any(), AtomRule(true).any()])
        XCTAssertTrue(sut.resolve(with: ResolvingContextMock()))
    }
}
