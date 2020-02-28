//
//  Rule+None.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

prefix operator ~~

public prefix func ~~ <Context: PRuleResolvingContext> (lhs: [AnyRule<Context>]) -> NoneOfRule<Context> {
    return NoneOfRule(lhs)
}
