//
//  ContentView.swift
//  Example
//
//  Created by Fumiya Tanaka on 2021/04/18.
//

import SwiftUI
import TabLayout

let children: [TabLayout.Element] = [
    TabLayout.Element(index: 0, name: "Sample 1"),
    TabLayout.Element(index: 1, name: "Sample 2"),
    TabLayout.Element(index: 2, name: "Sample 3"),
]

let mediator: TabLayoutMediator = TabLayoutMediator()

struct ContentView: View {
    var body: some View {
        TabLayout(
            children: children,
            tintColor: .green,
            backgroundColor: .white,
            mediator: mediator
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
