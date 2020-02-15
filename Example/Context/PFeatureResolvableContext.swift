//
//  PFeatureResolvableContext.swift
//  Example
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug

protocol PFeatureResolvableContext: PRuleResolvingContext {
    var enabledFeatures: [String] { get }
}
