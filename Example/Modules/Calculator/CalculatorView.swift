//
//  CalculatorView.swift
//  Example
//
//  Created by Tomasz Lewandowski on 29/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

struct CalculatorView: View {
    @State private var a: String = "0"
    @State private var b: String = "0"
    
    let resolver = CalculatorResolver()
    init() {
        
    }
    
    var body: some View {
        List {
            TextField("a", text: $a)
            TextField("b", text: $b)
            ForEach(resolver.pluginPoint.getAvailablePlugins(context: CalculatorContext())) { plugin in
                Text("\(self.a) \(plugin.plugin.symbol) \(self.b) = \(plugin.plugin.operation.calculate(a: Double(self.a) ?? 0, b: Double(self.b) ?? 0))")
            }
        }
    }
}
