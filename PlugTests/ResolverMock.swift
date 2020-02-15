//
//  ResolverMock.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug

final class ResolverMock: PRuleResolver {
    var resolveCalled = false
    
    func resolve() {
        resolveCalled = true
    }
}
