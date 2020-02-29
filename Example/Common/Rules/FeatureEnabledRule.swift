//
//  FeatureEnabledRule.swift
//  Example
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug

final class FeatureEnabledRule<Context: PFeatureResolvableContext>: PRule {
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func resolve(with context: Context) -> Bool {
        return context.enabledFeatures.contains(id)
    }
}
