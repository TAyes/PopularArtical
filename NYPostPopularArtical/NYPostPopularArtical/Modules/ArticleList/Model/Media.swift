
import Foundation
struct Media : Codable {
    var type : String?
    var subtype : String?
    var caption : String?
    var copyRight : String?
    var approvedSyndication : Int?
    var mediaMetadata : [MediaMetadata]?

	enum CodingKeys: String, CodingKey {
		case type
		case subtype
		case caption
		case copyRight = "copyright"
		case approvedSyndication = "approved_for_syndication"
		case mediaMetadata = "media-metadata"
	}

}
