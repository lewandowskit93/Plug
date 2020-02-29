//
//  CalculatorResolver.swift
//  Example
//
//  Created by Tomasz Lewandowski on 29/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import SwiftUI

class CalculatorResolver {
    typealias Context = CalculatorContext
    typealias Plugin = IdentifiedPlugin<CalculatorPlugin>
    let pluginPoint: PluginPoint<Context, Plugin>
    
    init() {
        pluginPoint = PluginPoint {
            plugin(contextType: Context.self) { IdentifiedPlugin(id: "1", wrappedValue: CalculatorPlugin(symbol: "+", operation: AdditionOperation())) }
            plugin(contextType: Context.self) { IdentifiedPlugin(id: "2", wrappedValue: CalculatorPlugin(symbol: "-", operation: SubtractionOperation())) }
            plugin(contextType: Context.self) { IdentifiedPlugin(id: "3", wrappedValue: CalculatorPlugin(symbol: "*", operation: MultiplicationOperation())) }
        }
    }
}
