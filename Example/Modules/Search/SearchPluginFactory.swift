//
//  SearchPluginFactory.swift
//  Example
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import Combine
import Plug

struct SearchPluginFactory {
    func someValueDataSource() -> SearchPlugin<SearchResultEntry> {
        return SearchPlugin { (query: String) -> AnyPublisher<[SearchResultEntry], Never> in
            return Just(
                [
                    SearchResultEntry(value: "some value"),
                    .init(value: "some value 2"),
                    .init(value: "some value 3")
                ].filter { $0.value.localizedCaseInsensitiveContains(query) }).eraseToAnyPublisher()
        }
    }
    
    func otherValueDataSource() -> SearchPlugin<SearchResultEntry> {
        return SearchPlugin { (query: String) -> AnyPublisher<[SearchResultEntry], Never> in
            return Just(
                [
                    SearchResultEntry(value: "other value "),
                    .init(value: "other value 2"),
                    .init(value: "other value 3")
                ].filter { $0.value.localizedCaseInsensitiveContains(query) }).eraseToAnyPublisher()
        }
    }
}
