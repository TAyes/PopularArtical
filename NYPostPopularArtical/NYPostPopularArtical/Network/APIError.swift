
import SwiftUI

enum APIError: Error, Equatable {
    case request(message: String)
    
    static func map(_ error: Error) -> APIError {
        return (error as? APIError) ?? .request(message: error.localizedDescription)
    }
    
    static func == (lhs: APIError, rhs: APIError) -> Bool {
                switch (lhs, rhs) {
                case (let .request(lhsMessage), let .request(rhsMessage)):
                      return (lhsMessage) == (rhsMessage)
                }
            }

}
