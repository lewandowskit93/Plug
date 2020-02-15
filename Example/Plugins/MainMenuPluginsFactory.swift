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
    func helloWorldPlugin() -> IdentifiedPlugin<ViewPlugin<AnyView>> {
        return IdentifiedPlugin(
            id: "hello",
            wrappedValue: ViewPlugin {
                return AnyView(HelloWorldView())
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
                return AnyView(Text(title))
            }
        )
    }

}
