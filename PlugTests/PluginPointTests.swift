//
//  PluginPointTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import XCTest

public final class PluginPointTests: XCTestCase {
    func testDescriptioveDSL_WhenUsed_ShouldReturnCorrectPluginPoint() {
        let p1 = PluginMock()
        let p2 = PluginMock()
        let p3 = PluginMock()
        let p4 = PluginMock()

        let pp = PluginPoint<ResolvingContextMock, PluginMock> {
            plugin(contextType: ResolvingContextMock.self) { p1 }
            plugin(contextType: ResolvingContextMock.self) { p2 }
            child {
                PluginPoint {
                    plugin(contextType: ResolvingContextMock.self) { p3 }
                    rule(pluginType: PluginMock.self) { DisabledRule<ResolvingContextMock>() }
                    child {
                        PluginPoint {
                            plugin(contextType: ResolvingContextMock.self) { p4 }
                        }
                    }
                }
            }
            child {
                PluginPoint {
                    child {
                        PluginPoint {
                            rule(pluginType: PluginMock.self) { DisabledRule<ResolvingContextMock>() }
                        }
                    }
                }
            }
        }
        XCTAssertEqual(2, pp.getAvailablePlugins(context: ResolvingContextMock()).count)
        let plugins = pp.getAvailablePlugins(context: ResolvingContextMock())
        XCTAssertTrue(plugins.contains(where: { $0 === p1 }))
        XCTAssertTrue(plugins.contains(where: { $0 === p2 }))
    }
}
