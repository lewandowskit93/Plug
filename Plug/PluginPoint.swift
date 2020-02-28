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
    
    /** Creates plugin point with the use of function builder
     # Example usage:
     ```swift
     var pluginPoint = PluginPoint() {
        child {
             plugin(contextType: MyContext.self) { pluginFactory.feature1Plugin() }
             rule(pluginType: MyPlugin.self) { FeatureEnabledRule(id: "feature_1") }
        }
     }
     ```
     */
    public init(@PluginPointBuilder<Context, Plugin> entries: () -> [PluginPointEntry<Context, Plugin>]) {
        var rules = [AnyRule<Context>]()
        var plugins = [Plugin]()
        var children = [PluginPoint<Context, Plugin>]()
        for entry in entries() {
            switch entry {
            case .rule(let rule):
                rules.append(rule)
            case .plugin(let plugin):
                plugins.append(plugin)
            case .child(let child):
                children.append(child)
            }
        }
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
