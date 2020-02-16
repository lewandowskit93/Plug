//
//  RuleDSLTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public class RuleDSLTests: XCTestCase {
    func testAllOfRule_WhenUsedWithDSL_ShouldCreateCorrectRule() {
        let r1 = RuleMock(false).any()
        let r2 = RuleMock(false).any()
        let r3 = RuleMock(false).any()
        let _: AllOfRule<ResolvingContextMock> = &&[r1, r2, r3]
    }
    
    func testNoneOfRule_WhenUsedWithDSL_ShouldCreateCorrectRule() {
        let r1 = RuleMock(false).any()
        let r2 = RuleMock(false).any()
        let r3 = RuleMock(false).any()
        let _: NoneOfRule<ResolvingContextMock> = ~~[r1, r2, r3]
    }
    
    func testAnyOfRule_WhenUsedWithDSL_ShouldCreateCorrectRule() {
        let r1 = RuleMock(false).any()
        let r2 = RuleMock(false).any()
        let r3 = RuleMock(false).any()
        let _: AnyOfRule<ResolvingContextMock> = ||[r1, r2, r3]
    }
    
    func testNegate_WhenUsedWIthDSL_ShouldCreateCorrectRule() {
        let _: InvertedRule<ResolvingContextMock> = !RuleMock(false).any()
    }
}
