//
//  TabbarView.swift
//  Example
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    var viewModel: TabbarViewModel = TabbarViewModel()
    
    init() {
        
    }
    
    var body: some View {
        TabView {
            ForEach(viewModel.pluginPoint.getAvailablePlugins(context: TabbarContext())) { plugin in
                return plugin.plugin.view
            }
        }
    }
}
