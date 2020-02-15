//
//  IdentifiedPlugin.swift
//  Plug
//
//  Created by Tomasz Lewandowski on 15/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

public final class IdentifiedPlugin<Plugin: PPlugin>: Identifiable, PPlugin {
    public let id: String
    public let plugin: Plugin
    
    public init(id: String, wrappedValue: Plugin) {
        self.plugin = wrappedValue
        self.id = id
    }
}
