//
//  PRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public protocol PRule: class {
    associatedtype Resolver: PRuleResolver
    
    func resolve(with: Resolver) -> Bool
}
