//
//  SearchViewModel.swift
//  Example
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Combine
import Plug

final class SearchViewModel: ObservableObject {
    typealias SearchPluginPoint = PluginPoint<SearchViewContext, SearchPlugin<SearchResultEntry>>
    let pluginFactory = SearchPluginFactory()
    let pluginPoint: SearchPluginPoint
    
    @Published var items: [SearchResultEntry] = [] {
        willSet {
          objectWillChange.send()
        }
    }

    var query: CurrentValueSubject<String, Never> = CurrentValueSubject("")
    
    var queryCancellable: AnyCancellable?
    var searchCancellable: AnyCancellable?
        
    init() {
        pluginPoint = (PluginPointBuilder()
            |+ ( PluginPointBuilder()
                    <+ pluginFactory.someValueDataSource()
                    §+ FeatureEnabledRule(id: "data_source_1").any()
                )^
            |+ ( PluginPointBuilder()
                <+ pluginFactory.otherValueDataSource()
                §+ FeatureEnabledRule(id: "data_source_2").any()
            )^
        )^
        queryCancellable = query.sink { [unowned self] query in
            self.searchWith(query: query)
        }
    }
    
    func searchWith(query: String) {
        var publisher: AnyPublisher<[SearchResultEntry], Never> = Just([])
            .eraseToAnyPublisher()
        for plugin in pluginPoint.getAvailablePlugins(context: SearchViewContext()) {
            let emmitedItems = Just([])
                .merge(with: plugin.items(query: query))
                .eraseToAnyPublisher()
            publisher = publisher.combineLatest(emmitedItems)
                .compactMap { i1, i2 in i1 + i2 }
                .eraseToAnyPublisher()
        }
        searchCancellable = publisher.sink { [weak self] (items) in
            self?.items = items
        }
    }
}
