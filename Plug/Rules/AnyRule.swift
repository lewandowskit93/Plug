//
//  AnyRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public final class AnyRule<Resolver: PRuleResolver>: PRule {
    private let underlying: _AnyRuleBoxBase<Resolver>

    public init<Rule: PRule>(_ rule: Rule) where Rule.Resolver == Resolver {
        self.underlying = _AnyRuleBox(rule)
    }
    
    public func resolve(with resolver: Resolver) -> Bool {
        return underlying.resolve(with: resolver)
    }
}

public extension PRule {
    func any() -> AnyRule<Resolver> {
        return AnyRule(self)
    }
}

private final class _AnyRuleBox<Rule: PRule>: _AnyRuleBoxBase<Rule.Resolver> {
    private let underlying: Rule
    
    init(_ rule: Rule) {
        self.underlying = rule
    }
    
    override func resolve(with resolver: Resolver) -> Bool {
        return underlying.resolve(with: resolver)
    }
}

private class _AnyRuleBoxBase<Resolver: PRuleResolver>: PRule {
    func resolve(with: Resolver) -> Bool {
        fatalError("Should be overriden")
    }
}
