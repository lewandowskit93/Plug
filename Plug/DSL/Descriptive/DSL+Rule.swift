//
//  DSL+Rule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public func rule<Rule: PRule, Context, Plugin>(pluginType: Plugin.Type = Plugin.self, _ rule: () -> Rule) -> PluginPointEntry<Context, Plugin> where Rule.Context == Context {
    return .rule(rule: rule().any())
}
