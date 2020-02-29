//
//  CalculatorPlugin.swift
//  Example
//
//  Created by Tomasz Lewandowski on 29/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Plug

class CalculatorPlugin: PPlugin {
    let symbol: String
    let operation: PCalculatorOperation
    
    init(symbol: String, operation: PCalculatorOperation) {
        self.symbol = symbol
        self.operation = operation
    }
}
