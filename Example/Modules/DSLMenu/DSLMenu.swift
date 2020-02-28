//
//  DSLMenu.swift
//  Example
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

struct DSLMenu: View {
    typealias MenuPluginPoint = PluginPoint<MainMenuContext, IdentifiedPlugin<ViewPlugin<AnyView>>>
    let pluginFactory = MainMenuPluginsFactory()
    let pluginPoint: MenuPluginPoint
    
    init() {
        pluginPoint = (PluginPointBuilder()
            <+ pluginFactory.helloDSLPlugin()
            |+ ( PluginPointBuilder()
                    <+ pluginFactory.feature1Plugin()
                    §+ FeatureEnabledRule(id: "feature_1").any()
                )^
            |+ ( PluginPointBuilder()
                    <+ pluginFactory.feature2Plugin()
                    §+ FeatureEnabledRule(id: "feature_2").any()
                )^
            |+ ( PluginPointBuilder()
                    <+ pluginFactory.feature3Plugin()
                    §+ FeatureEnabledRule(id: "feature_3").any()
                )^
            |+ ( PluginPointBuilder()
                    <+ pluginFactory.feature4Plugin()
                    §+ FeatureEnabledRule(id: "feature_4").any()
                )^
            |+ ( PluginPointBuilder()
                    <+ pluginFactory.feature5Plugin()
                    §+ FeatureEnabledRule(id: "feature_5").any()
                )^
            )^
    }
    
    var body: some View {
        List {
            ForEach(pluginPoint.getAvailablePlugins(context: MainMenuContext())) { plugin in
                return plugin.plugin.view
            }
        }
    }
}
