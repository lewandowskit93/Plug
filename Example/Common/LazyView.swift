//
//  LazyView.swift
//  Example
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI

struct LazyView<V: View>: View {
    private let builder: () -> V
    
    init(_ builder: @escaping () -> V) {
        self.builder = builder
    }
    
    var body: V {
        builder()
    }
}
