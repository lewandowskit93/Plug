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
    func profile() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(id: "profile", wrappedValue: ViewPlugin {
            AnyView(Text("Profile")
              .tabItem {
                 Image(systemName: "person.fill")
                 Text("Profile")
               })
        })
    }
    
    func message() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(id: "message", wrappedValue: ViewPlugin {
            AnyView(Text("Message")
              .tabItem {
                 Image(systemName: "message.fill")
                 Text("Message")
            })
        })
    }
    
    func call() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(id: "call", wrappedValue: ViewPlugin {
            AnyView(Text("Call")
              .tabItem {
                 Image(systemName: "phone.fill")
                 Text("Call")
            })
        })
    }
}
