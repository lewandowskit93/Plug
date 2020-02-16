//
//  AnyRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

/// Type-erased rule wrapper
public final class AnyRule<Context: PRuleResolvingContext>: PRule {
    private let underlying: _AnyRuleBoxBase<Context>

    /// Creates the rule
    public init<Rule: PRule>(_ rule: Rule) where Rule.Context == Context {
        self.underlying = _AnyRuleBox(rule)
    }
    
    public func resolve(with context: Context) -> Bool {
        return underlying.resolve(with: context)
    }
}

public extension PRule {
    func any() -> AnyRule<Context> {
        return AnyRule(self)
    }
}

private final class _AnyRuleBox<Rule: PRule>: _AnyRuleBoxBase<Rule.Context> {
    private let underlying: Rule
    
    init(_ rule: Rule) {
        self.underlying = rule
    }
    
    override func resolve(with context: Context) -> Bool {
        return underlying.resolve(with: context)
    }
}

private class _AnyRuleBoxBase<Context: PRuleResolvingContext>: PRule {
    func resolve(with: Context) -> Bool {
        fatalError("Should be overriden")
    }
}
