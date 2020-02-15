//
//  AnyRuleTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public class AnyRuleTests: XCTestCase {
    private var contextMock: ResolvingContextMock!
    private var sut: AnyRule<ResolvingContextMock>!
    
    public override func setUp() {
        contextMock = ResolvingContextMock()
        sut = AnyRule(RuleMock(true))
    }
    func testResolve_WhenCalled_ShouldPassContext() {
        XCTAssertFalse(contextMock.resolveCalled)
        _ = sut.resolve(with: contextMock)
        XCTAssertTrue(contextMock.resolveCalled)
    }
    
    func testResolve_WhenCalledAndUnderlyigReturnsTrue_ShouldReturnTrue() {
        sut = AnyRule(RuleMock(true))
        XCTAssertTrue(sut.resolve(with: contextMock))
    }

    func testResolve_WhenCalledAndUnderlyigReturnsFalse_ShouldReturnFalse() {
        sut = RuleMock(false).any()
        XCTAssertFalse(sut.resolve(with: contextMock))
    }
}
