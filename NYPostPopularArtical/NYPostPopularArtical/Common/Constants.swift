

class Constants {
    static let key = KeyVault.apiKey.value
    static func checkForAPIKey() {
        precondition(Constants.key != "YourAPIKey", "Condition: \nEither your APIKey is invalid or you haven't filled it yet. \nPlease Fill Your APIKey")
    }
    static let baseUrl = "https://api.nytimes.com/"
    static var mostPopular: String {
        return baseUrl + "svc/mostpopular/v2/mostviewed/all-sections/"
    }
    
    static let emptyImagePlacerHolder = "photo"
    static let alerttOKButton = "OK"
    static let articalListScreentitle = "Popular Articals"
    static let calanderDateIcon = "calendar"
    
}
