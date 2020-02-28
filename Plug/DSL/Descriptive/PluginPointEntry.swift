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
