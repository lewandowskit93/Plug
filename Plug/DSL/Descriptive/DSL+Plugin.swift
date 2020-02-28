//
//  DSL+Plugin.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public func plugin<Context: PRuleResolvingContext, Plugin: PPlugin>(contextType: Context.Type = Context.self, _ plugin: () -> Plugin) -> PluginPointEntry<Context, Plugin> {
    return .plugin(plugin: plugin())
}
