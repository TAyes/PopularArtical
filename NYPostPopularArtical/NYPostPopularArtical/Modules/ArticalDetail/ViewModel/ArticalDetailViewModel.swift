
import Foundation

// MARK: - protocol
protocol ArticalDetailViewModelType: ViewModelType {
    var article : Article { get }
    func setStringUrl() -> String
}

class ArticalDetailViewModel: ArticalDetailViewModelType {
    
    @Published var article: Article
    @Published var isLoading: Bool = true

    // MARK: - Initialization
    init(artical: Article) {
        self.article = artical
    }
    
    func setStringUrl() -> String {
        return ((article.media?.count ?? 0 > 0) ? ((article.media?.last?.mediaMetadata?.count ?? 0 > 0) ? (article.media?.last?.mediaMetadata?.last?.url ?? ""):""):"")
    }

}
