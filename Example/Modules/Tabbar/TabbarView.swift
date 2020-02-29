//
//  TabbarView.swift
//  Example
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    let resolver = TabbarResolver()
    
    init() {
        
    }
    
    var body: some View {
        TabView {
            ForEach(resolver.pluginPoint.getAvailablePlugins(context: TabbarContext())) { plugin in
                return plugin.plugin.view
            }
        }
    }
}
