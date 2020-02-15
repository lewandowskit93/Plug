//
//  EnabledRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public final class EnabledRule<Resolver: PRuleResolver>: PRule {
    private let atom = AtomRule<Resolver>(true)
    
    public init() {
        
    }
    
    public func resolve(with resolver: Resolver) -> Bool {
        return atom.resolve(with: resolver)
    }
}
