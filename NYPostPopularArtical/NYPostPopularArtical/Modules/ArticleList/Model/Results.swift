
import Foundation

struct Article : Codable, Identifiable, Hashable {
	var uri : String?
    var url : String?
    var id : Int?
    var assetId : Int?
    var source : String?
    var publishedDate : String?
    var updated : String?
    var section : String?
    var subsection : String?
    var nytdSection : String?
    var adxKeywords : String?
    var column : String?
    var byline : String?
    var type : String?
    var title : String?
    var abstract : String?
    var desFacet : [String]?
    var orgFacet : [String]?
    var perFacet : [String]?
    var geoFacet : [String]?
    var media : [Media]?
    var etaId : Int?
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

	enum CodingKeys: String, CodingKey {

		case uri
		case url
		case id
		case assetId = "asset_id"
		case source
		case publishedDate = "published_date"
		case updated
		case section
		case subsection
		case nytdSection = "nytdsection"
		case adxKeywords = "adx_keywords"
		case column
		case byline
		case type
		case title
		case abstract
		case desFacet = "des_facet"
		case orgFacet = "org_facet"
		case perFacet = "per_facet"
		case geoFacet = "geo_facet"
		case media
		case etaId = "eta_id"
	}
}
