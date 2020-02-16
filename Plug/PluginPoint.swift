//
//  PluginPoint.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

/// Defines a single pluggin slot that pluggins can be attached to.
public final class PluginPoint<Context: PRuleResolvingContext, Plugin: PPlugin> {
    let rules: [AnyRule<Context>]
    let plugins: [Plugin]
    let children: [PluginPoint<Context, Plugin>]
    
    /// Creates a plugin point
    init(rules: [AnyRule<Context>], plugins: [Plugin], children: [PluginPoint<Context, Plugin>]) {
        self.rules = rules
        self.plugins = plugins
        self.children = children
    }
    
    /// Gets available plugins if the context meets the rules conditions
    public func getAvailablePlugins(context: Context) -> [Plugin] {
        for rule in rules {
            guard rule.resolve(with: context) else { return [] }
        }
        return [plugins, children.flatMap { $0.getAvailablePlugins(context: context) }].flatMap { $0 }
    }
}
