//
//  DSL+Child.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public func child<Context: PRuleResolvingContext, Plugin: PPlugin>(_ child: () -> PluginPoint<Context, Plugin>) -> PluginPointEntry<Context, Plugin> {
    return .child(child: child())
}
