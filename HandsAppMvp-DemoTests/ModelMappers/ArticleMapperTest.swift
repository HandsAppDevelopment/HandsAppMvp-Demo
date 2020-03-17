import XCTest
@testable import HandsAppMvp_Demo

class ArticleMapperTest: XCTestCase {

    private let mapper = ArticleMapper()
    private let testData = ArticleMapperTestData()

    func testMapResponseToModel() {
        let testResults = testData.input.map {
            mapper.mapResponseToModel(response: $0)
        }
        XCTAssertEqual(testResults, testData.output)
    }
}
