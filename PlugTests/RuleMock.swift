//
//  RuleMock.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug

final class RuleMock: PRule {
    var returnValue: Bool = true
    
    init(_ value: Bool) {
        returnValue = value
    }
    
    func resolve(with context: ResolvingContextMock) -> Bool {
        context.resolve()
        return returnValue
    }
}
