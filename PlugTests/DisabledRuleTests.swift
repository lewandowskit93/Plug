//
//  DisabledRuleTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public class DisabledRuleTests: XCTestCase {
    func testResolve_WhenCalled_ShouldReturnFalse() {
        XCTAssertFalse(DisabledRule().resolve(with: ResolvingContextMock()))
    }
}
