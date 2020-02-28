//
//  Rule+Negate.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public prefix func ! <Context: PRuleResolvingContext> (lhs: AnyRule<Context>) -> InvertedRule<Context> {
    return lhs.inverted()
}
