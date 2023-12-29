@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testUsers() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "users", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "[{\"name\":\"User1\"},{\"name\":\"User2\"}]")
        })
    }
    
    func testUsers21() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "/users/21", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Show user for user id = 21")
        })
    }
}
