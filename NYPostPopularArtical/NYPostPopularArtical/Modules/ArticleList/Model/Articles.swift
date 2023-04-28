
import Foundation

typealias Articles = [Article]

// MARK: - Employee
struct ArticlesResponse : Codable {
    
    var status      : String?
    var copyRight   : String?
    var numResults : Int?
    var articles    : [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case copyRight   = "copyright"
        case numResults = "num_results"
        case articles    = "results"
    }

}
