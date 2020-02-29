//
//  TabbarContext.swift
//  Example
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug

class TabbarContext: PFeatureResolvableContext, PSubscriptionContext {
    let enabledFeatures: [String] = ["profile", "message", "call"]
    let hasSubscription: Bool = true
}
