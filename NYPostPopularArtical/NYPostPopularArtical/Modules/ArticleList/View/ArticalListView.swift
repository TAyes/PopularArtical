
import SwiftUI

struct ArticalListView<T: ArticalListViewModelType>: View {
    var articalListViewModel: T//2
    var body: some View {
                List {
                    ForEach(articalListViewModel.articleList, id: \.self) { m in
                        NavigationLink(destination: NavigationLazyView(ArticalDetail(articalDetailViewModel: ArticalDetailViewModel(artical: m)))) {
                            ArticalCell(viewModel: articalListViewModel, article: m)
                        }
                    }
                }.listStyle(SidebarListStyle())
            .navigationTitle(Constants.articalListScreentitle)
        }
}

struct ArticalListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticalListView(articalListViewModel: ArticalListViewModel(loginFetcher: RequestAPI()))
    }
}
