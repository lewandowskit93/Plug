//
//  ViewPlugin.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

public final class ViewPlugin<V: View>: PPlugin {
    private let builder: () -> V
    
    public init(builder: @escaping () -> V) {
        self.builder = builder
    }
    
    public var view: some View {
        return builder()
    }
}

