//
//  SerchView.swift
//  Example
//
//  Created by Tomasz Lewandowski on 16/02/2020.
//  Copyright © 2020 LionSoftware.org. All rights reserved.
//

import SwiftUI
import Plug

struct SearchView: View {
    @ObservedObject
    var viewModel: SearchViewModel = SearchViewModel()
    
    init() {
        
    }
    
    var body: some View {
        VStack {
            TextField("SEARCH: ", text: Binding<String>(
                get: { self.viewModel.query.value },
                set: { self.viewModel.query.value = $0 }))
            Text("searching \(viewModel.query.value)")
            List(self.viewModel.items) { item in
                Text(item.value)
            }
        }.padding()
    }
}
