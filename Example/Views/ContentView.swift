//
//  MainMenu.swift
//  Example
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

struct MainMenu: View {
    typealias MenuPluginPoint = PluginPoint<MainMenuContext, IdentifiedPlugin<ViewPlugin<AnyView>>>
    let pluginFactory = MainMenuPluginsFactory()
    let pluginPoint: MenuPluginPoint
    
    init() {
        pluginPoint = PluginPointBuilder()
            .add(plugin: pluginFactory.helloWorldPlugin())
            .add(child: PluginPointBuilder()
                .add(plugin: pluginFactory.feature1Plugin())
                .add(plugin: pluginFactory.feature2Plugin())
                .add(child: PluginPointBuilder()
                    .add(plugin: pluginFactory.feature3Plugin())
                    .build()
                )
                .build()
            )
            .add(child: PluginPointBuilder()
                .add(plugin: pluginFactory.feature4Plugin())
                .add(child: PluginPointBuilder()
                    .add(plugin: pluginFactory.feature5Plugin())
                    .build()
                )
                .add(rule: DisabledRule().any())
                .build()
            )
            .build()
    }
    
    var body: some View {
        List {
            ForEach(pluginPoint.getAvailablePlugins(context: MainMenuContext())) { plugin in
                return plugin.plugin.view
            }
        }
    }
}


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
