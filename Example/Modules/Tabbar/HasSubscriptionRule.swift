//
//  HasSubscriptionRule.swift
//  Example
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug

final class HasSubscriptionRule<Context: PRuleResolvingContext>: PRule {
    init() {
    }
    
    func resolve(with context: Context) -> Bool {
        return true
    }
}
