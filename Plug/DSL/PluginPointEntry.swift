//
//  PluginPointEntry.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 27/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public enum PluginPointEntry<Context: PRuleResolvingContext, Plugin: PPlugin> {
    case rule(rule: AnyRule<Context>)
    case plugin(plugin: Plugin)
    case child(child: PluginPoint<Context, Plugin>)
}

public func rule<Rule: PRule, Context, Plugin>(pluginType: Plugin.Type = Plugin.self, _ rule: () -> Rule) -> PluginPointEntry<Context, Plugin> where Rule.Context == Context {
    return .rule(rule: rule().any())
}

public func plugin<Context: PRuleResolvingContext, Plugin: PPlugin>(contextType: Context.Type = Context.self, _ plugin: () -> Plugin) -> PluginPointEntry<Context, Plugin> {
    return .plugin(plugin: plugin())
}

public func child<Context: PRuleResolvingContext, Plugin: PPlugin>(_ child: () -> PluginPoint<Context, Plugin>) -> PluginPointEntry<Context, Plugin> {
    return .child(child: child())
}
