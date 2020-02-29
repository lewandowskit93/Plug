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
    func jedi() -> SearchPlugin<SearchResultEntry> {
        return SearchPlugin { (query: String) -> AnyPublisher<[SearchResultEntry], Never> in
            return Just(
                [
                    SearchResultEntry(value: "Obi-Wan Kenobi"),
                    .init(value: "Yoda"),
                    .init(value: "Mace Windu"),
                    .init(value: "Luke Skywalker"),
                    .init(value: "Anakin Skywalker")
                ].filter { $0.value.localizedCaseInsensitiveContains(query) }).eraseToAnyPublisher()
        }
    }
    
    func sith() -> SearchPlugin<SearchResultEntry> {
        return SearchPlugin { (query: String) -> AnyPublisher<[SearchResultEntry], Never> in
            return Just(
                [
                    SearchResultEntry(value: "Darth Vader"),
                    .init(value: "Darth Sidious"),
                    .init(value: "Darth Maul"),
                    .init(value: "Darth Revan"),
                    .init(value: "Darth Bane")
                ].filter { $0.value.localizedCaseInsensitiveContains(query) }).eraseToAnyPublisher()
        }
    }
    
    func ship() -> SearchPlugin<SearchResultEntry> {
        return SearchPlugin { (query: String) -> AnyPublisher<[SearchResultEntry], Never> in
            return Just(
                [
                    SearchResultEntry(value: "X-Wing"),
                    .init(value: "Y-Wing"),
                    .init(value: "B-Wing"),
                    .init(value: "TIE Fighter"),
                    .init(value: "Star Destroyer"),
                    .init(value: "Death Star")
                ].filter { $0.value.localizedCaseInsensitiveContains(query) }).eraseToAnyPublisher()
        }
    }
}
