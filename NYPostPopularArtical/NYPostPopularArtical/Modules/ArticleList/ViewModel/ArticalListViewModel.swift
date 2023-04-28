
import Foundation
import SwiftUI
import Combine
import CoreLocation

// MARK: - protocol
protocol ArticalListViewModelType: ViewModelType {
    var error: String { get set}
    var articleList : Articles { get set }
    var pageAlert: AlertItem? { get set }
    func setStringUrl(article: Article) -> String
}


class ArticalListViewModel: ArticalListViewModelType {
    
    @Published var articleList: Articles = Articles()
    
    @Published var error: String = ""
    
    @Published var isLoading: Bool = true
    
    @Published var pageAlert:  AlertItem?
    
    var period = Periods.Week
        
    private var disposables = Set<AnyCancellable>()
    
    let loginFetcher: APISRequestFetchable
   
    // MARK: - Initialization
    init(loginFetcher: APISRequestFetchable) {
        self.loginFetcher = loginFetcher
        if !jailBrokenDeviceCheck() {
            loadCurrentData(suffixURL: .Week)
        } else  {
            pageAlert = AlertItem(message: "Your device is jail broken, sorry we can not proceed with this device", title: "Failed")
        }
    }
}


// MARK: - Func
extension ArticalListViewModel {
    func setStringUrl(article: Article) -> String {
        return ((article.media?.count ?? 0 > 0) ? ((article.media?.last?.mediaMetadata?.count ?? 0 > 0) ? (article.media?.last?.mediaMetadata?.last?.url ?? ""):""):"")
    }
}


// MARK: - Private Func
private extension ArticalListViewModel {
    private func jailBrokenDeviceCheck() -> Bool{
        return UIDevice.current.isJailBroken
    }

   private func prepareURL(suffixURL: Periods) -> URL? {
       guard var urlComps = URLComponents(string: Constants.mostPopular + "\(suffixURL.rawValue)" + ".json") else {return nil}
            urlComps.queryItems = [URLQueryItem(name: "api-key", value: Constants.key)]
        guard let url = urlComps.url else {return nil}
        return url
    }
    
}


// MARK: - ApiCall
extension ArticalListViewModel {
    private func loadCurrentData(suffixURL: Periods) {
       
        Constants.checkForAPIKey()
        guard let url = prepareURL(suffixURL: suffixURL) else {return }
        isLoading = true
       loginFetcher.fetchArticalList(fromURL: url).receive(on: DispatchQueue.main)
                   .sink { [weak self] value in
                       
                       switch value {
                       case .failure(let error):
                           self?.error = error.localizedDescription
                           if case APIError.request(let message) = error {
                               self?.pageAlert = AlertItem(message: message, title: "Failed")
                           }
                           self?.isLoading = false
                       case .finished:
                           self?.isLoading = false
                       }
                   } receiveValue: { [weak self] result in
                       guard let ws = self else { return }
                       ws.articleList = result.articles ?? []
                   }
                   .store(in: &disposables)
    }
    
}
