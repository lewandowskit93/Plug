//
//  TabbarViewModel.swift
//  Example
//
//  Created by Tomasz Lewandowski on 27/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

final class TabbarViewModel {
    typealias Context = TabbarContext
    typealias Plugin = IdentifiedPlugin<ViewPlugin<AnyView>>
    typealias FeaturesPluginPoint = PluginPoint<Context, Plugin>
    let pluginFactory = TabFeaturesFactory()
    let pluginPoint: FeaturesPluginPoint
    
    init() {
        let pluginFactory = self.pluginFactory
        pluginPoint = PluginPoint {
            child {
                PluginPoint {
                    rule(pluginType: Plugin.self) {
                        &&[FeatureEnabledRule<Context>(id: "tab_1").any(), HasSubscriptionRule<Context>().any()]
                    }
                    plugin(contextType: Context.self) { pluginFactory.premiumFeature() }
                }
            }
            child {
                PluginPoint {
                    rule(pluginType: Plugin.self) {
                        FeatureEnabledRule<Context>(id: "tab_2")
                    }
                    plugin(contextType: Context.self) { pluginFactory.freeFeature() }
                }
            }
        }
    }
}
