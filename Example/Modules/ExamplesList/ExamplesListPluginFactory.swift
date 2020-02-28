//
//  ExamplesListPluginFactory.swift
//  Example
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

struct ExamplesListPluginFactory {
    func tabbarPlugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(
            id: "tabbar",
            wrappedValue: ViewPlugin {
                return AnyView(
                    NavigationLink(
                        destination: LazyView { TabbarView() }
                    ) { Text("Tabbar") })
            }
        )
    }
    
    func searchEngine() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(
            id: "search_engine",
            wrappedValue: ViewPlugin {
                return AnyView(
                    NavigationLink(
                        destination: LazyView { SearchView() }
                    ) { Text("Search Engine") })
            }
        )
    }
    
    func calculator() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(
            id: "calculator",
            wrappedValue: ViewPlugin {
                return AnyView(
                    NavigationLink(
                        destination: LazyView { TabbarView() }
                    ) { Text("Calculator") })
            }
        )
    }
}
