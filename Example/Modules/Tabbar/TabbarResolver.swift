//
//  TabbarResolver.swift
//  Example
//
//  Created by Tomasz Lewandowski on 27/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

final class TabbarResolver {
    typealias Context = TabbarContext
    typealias Plugin = IdentifiedPlugin<ViewPlugin<AnyView>>
    typealias FeaturesPluginPoint = PluginPoint<Context, Plugin>
    let pluginFactory = TabFeaturesFactory()
    let pluginPoint: FeaturesPluginPoint
    
    init() {
        pluginPoint = (PluginPointBuilder()
            |+ ( PluginPointBuilder()
                    <+ pluginFactory.profile()
                    §+ FeatureEnabledRule(id: "profile").any()
                )^
            |+ ( PluginPointBuilder()
                <+ pluginFactory.message()
                §+ FeatureEnabledRule(id: "message").any()
            )^
            |+ ( PluginPointBuilder()
                <+ pluginFactory.call()
                §+ FeatureEnabledRule(id: "call").any()
                §+ HasSubscriptionRule().any()
            )^
        )^
        
    }
}
