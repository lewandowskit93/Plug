//
//  PluginPointBuilderTests.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

@testable import Plug
import XCTest

public class PluginPointBuilderTests: XCTestCase {
    var sut: PluginPointBuilder<ResolvingContextMock, PluginMock>!
    
    public override func setUp() {
        sut = PluginPointBuilder()
    }
    
    func testBuilding_WhenCalledAfterSetOfOperations_ShouldReturnCorrectPluginPoint() {
        let p1 = PluginMock()
        let p2 = PluginMock()
        let p3 = PluginMock()
        let p4 = PluginMock()
        let p5 = PluginMock()
        let p6 = PluginMock()
        let p7 = PluginMock()
        let p8 = PluginMock()
        
        // test adding and removing plugins
        sut.add(plugin: p1)
        sut.add(plugin: p2)
        sut.remove(plugin: p2)
        
        // test adding and removing children
        sut.add(
            child: PluginPoint(
                rules: [DisabledRule().any()],
                plugins: [p3],
                children: [PluginPoint(
                    rules: [EnabledRule().any()],
                    plugins: [p4],
                    children: []
                    )
                ]
            )
        )
        sut.add(
            child: PluginPoint(
                rules: [EnabledRule().any()],
                plugins: [p5],
                children: [PluginPoint(
                    rules: [],
                    plugins: [p6],
                    children: [PluginPoint(
                        rules: [DisabledRule().any()],
                        plugins: [p7],
                        children: [])
                    ])
                ]
            )
        )
        let child = PluginPoint<ResolvingContextMock, PluginMock>(rules: [], plugins: [p8], children: [])
        sut.add(child: child)
        sut.remove(child: child)
        
        // test adding and removing rules and actual output
        let rule = DisabledRule<ResolvingContextMock>().any()
        sut.add(rule: rule)
        let pp1 = sut.build()
        XCTAssertEqual(0, pp1.getAvailablePlugins(context: ResolvingContextMock()).count)
        sut.remove(rule: rule)
        let pp2 = sut.build()
        let plugins = pp2.getAvailablePlugins(context: ResolvingContextMock())
        XCTAssertEqual(3, plugins.count)
        XCTAssertTrue(plugins.contains(where: { $0 === p1 }))
        XCTAssertTrue(plugins.contains(where: { $0 === p5 }))
        XCTAssertTrue(plugins.contains(where: { $0 === p6 }))
    }
    
    func testDSL_WhenUsed_ShouldReturnCorrectPluginPoint() {
        let p1 = PluginMock()
        let p2 = PluginMock()
        let p3 = PluginMock()
        let p4 = PluginMock()
        let p5 = PluginMock()
        let child = PluginPoint<ResolvingContextMock, PluginMock>(rules: [], plugins: [p5], children: [])
        let rule = DisabledRule<ResolvingContextMock>().any()

        let pp = (sut
            <+ p1
            <+ p2
            >- p2
            |+ (PluginPointBuilder() §+ DisabledRule().any() <+ p3
                    |+ (PluginPointBuilder() <+ p4 §+ EnabledRule().any())^
                )^
            |+ child |- child
            §+ rule
            §- rule
            )^
        XCTAssertEqual(1, pp.getAvailablePlugins(context: ResolvingContextMock()).count)
        let plugins = pp.getAvailablePlugins(context: ResolvingContextMock())
        XCTAssertTrue(plugins.contains(where: { $0 === p1 }))
    }
}
