
import SwiftUI

struct ArticalCell<T: ArticalListViewModelType>: View {
    var viewModel: T//2
    @State var article: Article
    var body: some View {
        VStack {
            HStack{
                if let url = URL(string: viewModel.setStringUrl(article: article)) {
                    AsyncImage(
                        url: url,
                        placeholder: { ProgressView() },
                        image: { Image(uiImage: $0).resizable() }
                    ).frame(width: 120, height: 100)
                } else {
                    Image(systemName: Constants.emptyImagePlacerHolder).resizable().frame(width: 120, height: 100)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title ?? "")
                        .bold()
                        .font(.subheadline)
                        .lineLimit(1)
                    Text(article.abstract ?? "")
                        .font(.caption2)
                        .foregroundColor(Color.gray).lineLimit(3)
                    HStack {
                        Image(systemName: Constants.calanderDateIcon)
                        Text(article.publishedDate ?? "")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                    }
                }.padding(.vertical, 12)
            }
     
        }
    }
}

struct ArticalCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticalCell(viewModel: ArticalListViewModel(loginFetcher: RequestAPI()), article: Article())
    }
}
