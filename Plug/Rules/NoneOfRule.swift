//
//  NoneOfRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

/// Rule that returns true if none of underlying rules are satisfied
public final class NoneOfRule<Context: PRuleResolvingContext>: PRule {
    private let rules: [AnyRule<Context>]
    
    /// Creates the rule
    public init(_ rules: [AnyRule<Context>]) {
        self.rules = rules
    }
    
    public func resolve(with context: Context) -> Bool {
        for rule in rules {
            guard !rule.resolve(with: context) else { return false }
        }
        return true
    }
}
