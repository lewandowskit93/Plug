//
//  ExamplesListResolver.swift
//  Example
//
//  Created by Tomasz Lewandowski on 29/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug
import SwiftUI

class ExamplesListResolver {
    typealias Context = ExamplesListContext
    typealias Plugin = IdentifiedPlugin<ViewPlugin<AnyView>>
    let pluginsFactory = ExamplesListPluginFactory()
    let pluginPoint: PluginPoint<ExamplesListContext, Plugin>
    
    init() {
        pluginPoint =
            PluginPointBuilder()
                .add(child: PluginPointBuilder()
                    .add(plugin: pluginsFactory.tabbarPlugin())
                    .add(rule: FeatureEnabledRule(id: "tabbar").any())
                    .build()
                ).add(child: PluginPointBuilder()
                    .add(plugin: pluginsFactory.searchEngine())
                    .add(rule: FeatureEnabledRule(id: "search_engine").any())
                    .build()
                ).add(child: PluginPointBuilder()
                    .add(plugin: pluginsFactory.calculator())
                    .add(rule: FeatureEnabledRule(id: "calculator").any())
                    .build()
            ).build()
    }    
}
