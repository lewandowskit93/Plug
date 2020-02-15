//
//  PRule.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public protocol PRule: class {
    associatedtype Context: PRuleResolvingContext
    
    func resolve(with: Context) -> Bool
}
