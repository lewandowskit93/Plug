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
            .add(plugin: pluginFactory.helloPlugPlugin())
            .add(child: PluginPointBuilder()
                .add(plugin: pluginFactory.feature1Plugin())
                .add(rule: FeatureEnabledRule(id: "feature_1").any())
                .build()
            )
            .add(child: PluginPointBuilder()
                .add(plugin: pluginFactory.feature2Plugin())
                .add(rule: FeatureEnabledRule(id: "feature_2").any())
                .build()
            )
            .add(child: PluginPointBuilder()
                .add(plugin: pluginFactory.feature3Plugin())
                .add(rule: FeatureEnabledRule(id: "feature_3").any())
                .build()
            )
            .add(child: PluginPointBuilder()
                .add(plugin: pluginFactory.feature4Plugin())
                .add(rule: FeatureEnabledRule(id: "feature_4").any())
                .build()
            )
            .add(child: PluginPointBuilder()
                .add(plugin: pluginFactory.feature5Plugin())
                .add(rule: FeatureEnabledRule(id: "feature_5").any())
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
