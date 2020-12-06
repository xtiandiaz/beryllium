import XCTest
@testable import Beryllium

final class BerylliumTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Beryllium().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
