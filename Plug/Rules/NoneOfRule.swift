//
//  NoneOfRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public final class NoneOfRule<Context: PRuleResolvingContext>: PRule {
    private let rules: [AnyRule<Context>]
    
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
