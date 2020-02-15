//
//  ViewPlugin.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
import Plug

@available(iOS 13.0, *)
@available(OSX 10.15, *)
@available(watchOS 6.0, *)
@available(tvOS 13.0, *)
@available(macCatalyst 13.0, *)
public final class ViewPlugin<V: View>: PPlugin {
    private let builder: () -> V
    
    public init(builder: @escaping () -> V) {
        self.builder = builder
    }
    
    public var view: some View {
        return builder()
    }
}

#endif
