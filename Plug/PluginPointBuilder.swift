//
//  PluginPointBuilder.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public final class PluginPointBuilder<Context: PRuleResolvingContext, Plugin: PPlugin> {
    public private(set) var rules: [AnyRule<Context>] = []
    public private(set) var plugins: [Plugin] = []
    public private(set) var children: [PluginPoint<Context, Plugin>] = []
    
    public init() {
        
    }
    
    public func build() -> PluginPoint<Context, Plugin> {
        return PluginPoint(rules: rules, plugins: plugins, children: children)
    }
    
    @discardableResult public func add(rule: AnyRule<Context>) -> PluginPointBuilder {
        rules.append(rule)
        return self
    }
    
    @discardableResult public func remove(rule: AnyRule<Context>) -> PluginPointBuilder {
        rules.removeAll { $0 === rule }
        return self
    }
    
    @discardableResult public func add(plugin: Plugin) -> PluginPointBuilder {
        plugins.append(plugin)
        return self
    }
    
    @discardableResult public func remove(plugin: Plugin) -> PluginPointBuilder {
        plugins.removeAll { $0 === plugin }
        return self
    }
    
    @discardableResult public func add(child: PluginPoint<Context, Plugin>) -> PluginPointBuilder {
        children.append(child)
        return self
    }
    
    @discardableResult public func remove(child: PluginPoint<Context, Plugin>) -> PluginPointBuilder {
        children.removeAll { $0 === child }
        return self
    }
}
