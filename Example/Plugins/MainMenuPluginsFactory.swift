//
//  PluginsFactory.swift
//  Example
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

struct MainMenuPluginsFactory {
    func helloPlugPlugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(
            id: "NON-DSL",
            wrappedValue: ViewPlugin {
                return AnyView(NavigationLink(destination: DSLMenu()) { HelloPlugView() })
            }
        )
    }
    
    func helloDSLPlugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(
            id: "DSL",
            wrappedValue: ViewPlugin {
                return AnyView(NavigationLink(destination: MainMenu()) { HelloDSLView() })
            }
        )
    }

    func feature1Plugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return featurePlugin(id: "feature_1", title: "Feature 1")
    }
    
    func feature2Plugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return featurePlugin(id: "feature_2", title: "Feature 2")
    }

    func feature3Plugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return featurePlugin(id: "feature_3", title: "Feature 3")
    }

    func feature4Plugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return featurePlugin(id: "feature_4", title: "Feature 4")
    }
    
    func feature5Plugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return featurePlugin(id: "feature_5", title: "Feature 5")
    }
    
    private func featurePlugin(id: String, title: String) -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(
            id: id,
            wrappedValue: ViewPlugin {
                return AnyView(
                    NavigationLink(
                        destination: LazyView { SearchView() }
                    ) { Text(title) })
            }
        )
    }

}
