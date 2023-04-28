//
//  LazyView.swift
//  NYPostPopularArtical
//
//  Created by Syed Syeda on 28/04/2023.
//

import SwiftUI
struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
