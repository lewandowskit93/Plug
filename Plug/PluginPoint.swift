//
//  PluginPoint.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public final class PluginPoint<Context: PRuleResolvingContext, Plugin: PPlugin> {
    let rules: [AnyRule<Context>]
    let plugins: [Plugin]
    let children: [PluginPoint<Context, Plugin>]
    
    init(rules: [AnyRule<Context>], plugins: [Plugin], children: [PluginPoint<Context, Plugin>]) {
        self.rules = rules
        self.plugins = plugins
        self.children = children
    }
    
    public func getAvailablePlugins(context: Context) -> [Plugin] {
        for rule in rules {
            guard rule.resolve(with: context) else { return [] }
        }
        return [plugins, children.flatMap { $0.getAvailablePlugins(context: context) }].flatMap { $0 }
    }
}
