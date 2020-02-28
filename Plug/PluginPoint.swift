//
//  PluginPoint.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

/// Defines a single pluggin slot that pluggins are be attached to.
public final class PluginPoint<Context: PRuleResolvingContext, Plugin: PPlugin> {
    let rules: [AnyRule<Context>]
    let plugins: [Plugin]
    let children: [PluginPoint<Context, Plugin>]
    
    /// Creates a plugin point
    public init(rules: [AnyRule<Context>], plugins: [Plugin], children: [PluginPoint<Context, Plugin>]) {
        self.rules = rules
        self.plugins = plugins
        self.children = children
    }
    
    /** Creates plugin point with the use of function builder
     # Example usage:
     ```swift
     var pluginPoint = PluginPoint {
         child {
             PluginPoint {
                 rule(pluginType: Plugin.self) {
                     &&[FeatureEnabledRule<Context>(id: "tab_1").any(), HasSubscriptionRule<Context>().any()]
                 }
                 plugin(contextType: Context.self) { pluginFactory.premiumFeature() }
             }
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
    
    /** Creates plugin point with the use of function builder
    # Example usage:
    ```swift
    var pluginPoint = PluginPoint {
        child {
            PluginPoint {
                rule(pluginType: Plugin.self) {
                    &&[FeatureEnabledRule<Context>(id: "tab_1").any(), HasSubscriptionRule<Context>().any()]
                }
                plugin(contextType: Context.self) { pluginFactory.premiumFeature() }
            }
        }
    }
    ```
    */
    public init(@PluginPointBuilder<Context, Plugin> entry: () -> PluginPointEntry<Context, Plugin>) {
        var rules = [AnyRule<Context>]()
        var plugins = [Plugin]()
        var children = [PluginPoint<Context, Plugin>]()
        switch entry() {
        case .rule(let rule):
            rules.append(rule)
        case .plugin(let plugin):
            plugins.append(plugin)
        case .child(let child):
            children.append(child)
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
