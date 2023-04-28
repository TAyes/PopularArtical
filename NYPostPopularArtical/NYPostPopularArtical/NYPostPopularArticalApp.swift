//
//  NYPostPopularArticalApp.swift
//  NYPostPopularArtical
//
//  Created by Syed Syeda on 27/04/2023.
//

import SwiftUI

@main
struct NYPostPopularArticalApp: App {
    var body: some Scene {
        WindowGroup {
            ArticalView(articalListViewModel: ArticalListViewModel(loginFetcher: RequestAPI()))
        }
    }
}
