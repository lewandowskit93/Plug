//
//  ExamplesList.swift
//  Example
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

struct ExamplesList: View {
    let resolver = ExamplesListResolver()
    
    init() {
    }
    
    var body: some View {
        List {
            ForEach(resolver.pluginPoint.getAvailablePlugins(context: ExamplesListContext())) { AnyView($0.plugin.view) }
        }
    }
}
