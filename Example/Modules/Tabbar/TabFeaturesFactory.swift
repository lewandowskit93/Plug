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
    func freeFeature1() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(id: "free_feature_1", wrappedValue: ViewPlugin {
            AnyView(Text("Free feature 1")
              .tabItem {
                 Image(systemName: "person.fill")
                 Text("Free")
               })
        })
    }
    
    func premiumFeature1() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(id: "tab_1", wrappedValue: ViewPlugin {
            AnyView(Text("Premium feature")
              .tabItem {
                 Image(systemName: "phone.fill")
                 Text("Premium")
            })
        })
    }
}
