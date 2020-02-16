//
//  NoneOfRuleTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public class NoneOfRuleTests: XCTestCase {
    func testResolve_WhenAllRulesAreFalse_ShouldReturnTrue() {
        let sut = NoneOfRule<ResolvingContextMock>([AtomRule(false).any(), AtomRule(false).any()])
        XCTAssertTrue(sut.resolve(with: ResolvingContextMock()))
    }
    
    func testResolve_WhenOneRuleIsTrue_ShouldReturnFalse() {
        let sut = NoneOfRule<ResolvingContextMock>([AtomRule(true).any(), AtomRule(false).any()])
        XCTAssertFalse(sut.resolve(with: ResolvingContextMock()))
    }
    
    func testResolve_WhenAllRulesAreTrue_ShouldReturnFalse() {
        let sut = NoneOfRule<ResolvingContextMock>([AtomRule(true).any(), AtomRule(true).any()])
        XCTAssertFalse(sut.resolve(with: ResolvingContextMock()))
    }
}
