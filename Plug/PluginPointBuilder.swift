//
//  PluginPointBuilder.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

/** Builder for PluginPoints that allows to add/remove plugins, childerns and rules.
 # Example usage:
 ```swift
 var pluginPoint = PluginPointBuilder()
 .add(child: PluginPointBuilder()
     .add(plugin: pluginFactory.feature1Plugin())
     .add(rule: FeatureEnabledRule(id: "feature_1").any())
     .build()
 ).build()
 ```
 # Example operators usage:
 ```swift
 var pluginPoint = (
 PluginPointBuilder()
 |+ (
     PluginPointBuilder()
     <+ pluginFactory.feature1Plugin()
     §+ FeatureEnabledRule(id: "feature_1").any()
    )^
 )^
 ```
*/

@_functionBuilder
public final class PluginPointBuilder<Context: PRuleResolvingContext, Plugin: PPlugin> {
    public private(set) var rules: [AnyRule<Context>] = []
    public private(set) var plugins: [Plugin] = []
    public private(set) var children: [PluginPoint<Context, Plugin>] = []
    
    // Creates a builder
    public init() {
        
    }
    
    // Builds block of plugin point entries
    public static func buildBlock(_ entries: PluginPointEntry<Context, Plugin>...) -> [PluginPointEntry<Context, Plugin>] {
        return entries
    }
    
    /// Finalizes the build and returns builded PluginPoint
    public func build() -> PluginPoint<Context, Plugin> {
        return PluginPoint(rules: rules, plugins: plugins, children: children)
    }
    
    /// Adds single rule
    @discardableResult public func add(rule: AnyRule<Context>) -> PluginPointBuilder {
        rules.append(rule)
        return self
    }
    
    /// Removes given rule
    @discardableResult public func remove(rule: AnyRule<Context>) -> PluginPointBuilder {
        rules.removeAll { $0 === rule }
        return self
    }
    
    /// Adds plugin to a plugin slot
    @discardableResult public func add(plugin: Plugin) -> PluginPointBuilder {
        plugins.append(plugin)
        return self
    }
    
    /// Remoes plugin from the plugin slot
    @discardableResult public func remove(plugin: Plugin) -> PluginPointBuilder {
        plugins.removeAll { $0 === plugin }
        return self
    }
    
    /// Adds child plugin point. The rules applied to parent are also applied to a children.
    @discardableResult public func add(child: PluginPoint<Context, Plugin>) -> PluginPointBuilder {
        children.append(child)
        return self
    }
    
    /// Removes child plugin
    @discardableResult public func remove(child: PluginPoint<Context, Plugin>) -> PluginPointBuilder {
        children.removeAll { $0 === child }
        return self
    }
}
