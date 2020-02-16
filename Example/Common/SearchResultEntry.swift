//
//  SearchResultEntry.swift
//  Example
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

struct SearchResultEntry: Identifiable {
    var id: String {
        return value
    }
    
    let value: String
}
