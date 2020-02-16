//
//  InvertedRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

/// Rule that negates output of underlying rule
public final class InvertedRule<Context: PRuleResolvingContext>: PRule {
    private let rule: AnyRule<Context>
    
    /// Creates the rule
    public init(_ rule: AnyRule<Context>) {
        self.rule = rule
    }
    
    public func resolve(with context: Context) -> Bool {
        return !rule.resolve(with: context)
    }
}

public extension PRule {
    func inverted() -> InvertedRule<Context> {
        return InvertedRule(self.any())
    }
}
