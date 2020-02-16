//
//  AtomRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

/// Rule that represents constant value - true or false - depending on value it was initialized with
public final class AtomRule<Context: PRuleResolvingContext>: PRule {
    private let value: Bool
    
    /// Creates the rule
    public init(_ value: Bool) {
        self.value = value
    }
    
    public func resolve(with context: Context) -> Bool {
        return value
    }
}
