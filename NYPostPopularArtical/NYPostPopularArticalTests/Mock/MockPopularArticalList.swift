
@testable import NYPostPopularArtical
import Combine
import UIKit


final class MockPopularArticalList: APISRequestFetchable {
    
    enum ArticalListScenario {
        case success(model: ArticlesResponse)
        case failure(error: Error)
    }
    
    var articalListScenario: ArticalListScenario
    
    init(articalListScenario: ArticalListScenario) {
        self.articalListScenario = articalListScenario
    }
    
    
    func fetchArticalList(fromURL url: URL) -> AnyPublisher<NYPostPopularArtical.ArticlesResponse, NYPostPopularArtical.APIError> {
        switch articalListScenario {
             case .success(let model):
                 return Just(model)
                .setFailureType(to: APIError.self)
                     .eraseToAnyPublisher()
             case .failure(let error):
            return Fail(error: error as! APIError)
                     .eraseToAnyPublisher()
             }
    }
    
    
}
