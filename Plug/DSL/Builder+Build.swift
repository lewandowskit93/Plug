//
//  Builder+Build.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

postfix operator ^

@discardableResult public postfix func ^ <Context: PRuleResolvingContext, Plugin: PPlugin>(lhs: PluginPointBuilder<Context, Plugin>) -> PluginPoint<Context, Plugin> {
    return lhs.build()
}
