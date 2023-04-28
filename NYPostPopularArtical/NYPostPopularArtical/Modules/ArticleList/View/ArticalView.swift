//
//  ArticalView.swift
//  NYPostPopularArtical
//
//  Created by Syed Syeda on 28/04/2023.
//

import SwiftUI

struct ArticalView<T: ArticalListViewModelType>: View {
    @ObservedObject var articalListViewModel: T//2
    var body: some View {
        NavigationView {
            if articalListViewModel.isLoading {
                ProgressView()
            } else {
                ArticalListView(articalListViewModel: articalListViewModel)
            }
        }.alert(item: $articalListViewModel.pageAlert) { item in
            Alert(title: Text(item.title ?? "Info"), message: Text(item.message), dismissButton: .default(Text(Constants.alerttOKButton)))
        }
    }
}

struct ArticalView_Previews: PreviewProvider {
    static var previews: some View {
        ArticalView(articalListViewModel: ArticalListViewModel(loginFetcher: RequestAPI()))
    }
}
