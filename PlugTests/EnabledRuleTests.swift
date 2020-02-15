//
//  EnabledRuleTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public class EnabledRuleTests: XCTestCase {
    func testResolve_WhenCalled_ShouldReturnTrue() {
        XCTAssertTrue(EnabledRule().resolve(with: ResolverMock()))
    }
}
