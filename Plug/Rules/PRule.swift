//
//  PRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

/// Describes an abstract Rule which can be specified by implementing this protocol
public protocol PRule: class {
    associatedtype Context: PRuleResolvingContext
    
    /// Returns true if the rule conditions are meet by the given context or false otherwise
    func resolve(with: Context) -> Bool
}
