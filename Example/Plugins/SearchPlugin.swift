//
//  SearchPlugin.swift
//  Example
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Combine
import Plug

public final class SearchPlugin<Item>: PPlugin {
    private let request: (_ query: String) -> AnyPublisher<[Item], Never>
    
    public init(request: @escaping (_ query: String) -> AnyPublisher<[Item], Never>) {
        self.request = request
    }
    
    func items(query: String) -> AnyPublisher<[Item], Never> {
        return request(query)
    }
}
