//
//  TabFeaturesFactory.swift
//  Example
//
//  Created by Tomasz Lewandowski on 28/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Combine
import Plug

struct TabFeaturesFactory {
    func freeFeature() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(id: "tab_2", wrappedValue: ViewPlugin {
            AnyView(Text("Free feature")
              .tabItem {
                 Image(systemName: "phone.fill")
                 Text("Free")
               })
        })
    }
    
    func premiumFeature() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(id: "tab_1", wrappedValue: ViewPlugin {
            AnyView(Text("Premium feature")
              .tabItem {
                 Image(systemName: "phone.fill")
                 Text("Premium")
            })
        })
    }
}
