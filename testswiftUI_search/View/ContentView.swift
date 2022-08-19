//
//  ContentView.swift
//  testswiftUI_search
//
//  Created by betty on 2022/08/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SearchView()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
