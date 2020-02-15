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
    private var resolverMock: ResolverMock!
    private var sut: AnyRule<ResolverMock>!
    
    public override func setUp() {
        resolverMock = ResolverMock()
        sut = AnyRule(RuleMock(true))
    }
    func testResolve_WhenCalled_ShouldPassResolver() {
        XCTAssertFalse(resolverMock.resolveCalled)
        _ = sut.resolve(with: resolverMock)
        XCTAssertTrue(resolverMock.resolveCalled)
    }
    
    func testResolve_WhenCalledAndUnderlyigReturnsTrue_ShouldReturnTrue() {
        sut = AnyRule(RuleMock(true))
        XCTAssertTrue(sut.resolve(with: resolverMock))
    }

    func testResolve_WhenCalledAndUnderlyigReturnsFalse_ShouldReturnFalse() {
        sut = RuleMock(false).any()
        XCTAssertFalse(sut.resolve(with: resolverMock))
    }
}
