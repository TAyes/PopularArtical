
import XCTest
import Combine
@testable import NYPostPopularArtical

final class NYPostPopularArticalTests: XCTestCase {

    var articalListViewModel: ArticalListViewModel!
    var mockPopularArticalList: MockPopularArticalList!
    
    private var disposables = Set<AnyCancellable>()
    
    override func setUp() {
    
    }
    
    override func tearDownWithError() throws {
        
        articalListViewModel = nil
        mockPopularArticalList = nil
         try super.tearDownWithError()
     }
    
    func testArticalListFailure() {
    
        mockPopularArticalList = MockPopularArticalList(articalListScenario: .failure(error: APIError.request(message: "Invalid URL")))
        articalListViewModel = .init(loginFetcher: mockPopularArticalList)
        
        let expectation = XCTestExpectation(description: "State is set to populated")

        articalListViewModel.loginFetcher.fetchArticalList(fromURL: URL(string: "abc")!).sink { value in
           XCTAssertEqual(value, .failure(APIError.request(message: "Decode Data Error")))
           expectation.fulfill()
        } receiveValue: { result in
            XCTAssertEqual(result.numResults, 20)
        }.store(in: &disposables)
      
        expectation.fulfill()

        wait(for: [expectation], timeout: 1)
        
    }
    
    func testArticalListSuccess() {
        
        mockPopularArticalList = MockPopularArticalList(articalListScenario: .success(model:ArticlesResponse(numResults: 20)))
        
        articalListViewModel = .init(loginFetcher: mockPopularArticalList)
        
        let expectation = XCTestExpectation(description: "State is set to populated")
        
        articalListViewModel.loginFetcher.fetchArticalList(fromURL: URL(string: "www.abc.com")!).sink { value in
           expectation.fulfill()
        } receiveValue: { result in
            XCTAssertEqual(result.numResults, 20)
        }.store(in: &disposables)
      
        expectation.fulfill()

        wait(for: [expectation], timeout: 1)
        
    }

}
