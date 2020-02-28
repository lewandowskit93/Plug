//
//  Builder+RemoveRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

infix operator §-: BuildingPrecedenceGroup

@discardableResult public func §- <Context: PRuleResolvingContext, Plugin: PPlugin>(
    lhs: PluginPointBuilder<Context, Plugin>,
    rhs: AnyRule<Context>) -> PluginPointBuilder<Context, Plugin> {
    return lhs.remove(rule: rhs)
}
