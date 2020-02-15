//
//  DisabledRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public final class DisabledRule<Context: PRuleResolvingContext>: PRule {
    private let atom = AtomRule<Context>(false)
    
    public init() {
        
    }
    
    public func resolve(with context: Context) -> Bool {
        return atom.resolve(with: context)
    }
}
