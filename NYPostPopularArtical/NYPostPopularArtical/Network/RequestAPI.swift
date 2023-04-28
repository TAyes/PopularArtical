
import Foundation
import UIKit
import Combine

// MARK: - protocol
protocol ViewModelType: ObservableObject {
    var isLoading: Bool { get set }
}

protocol APISRequestFetchable {
    func fetchArticalList(fromURL url: URL) -> AnyPublisher<ArticlesResponse, APIError>
}

class RequestAPI {
    private let session: URLSession
    init(session: URLSession = URLSession(configuration: .ephemeral, delegate: CertificatePinningURLSessionDelegate(), delegateQueue: nil)) {
        self.session = session
    }
}

private extension RequestAPI {
    func requiredRequest(fromURL url: URL) throws -> URLRequest {
        return URLRequest(url: url)
    }
}


extension RequestAPI: APISRequestFetchable, Fetchable {
    func fetchArticalList(fromURL url: URL) -> AnyPublisher<ArticlesResponse, APIError> {
        
        guard let request = try? self.requiredRequest(fromURL: url) else {
            return Fail(error: APIError.request(message: "Invalid URL")).eraseToAnyPublisher()
        }
        return fetch(with: request, session: self.session)
    }
}

