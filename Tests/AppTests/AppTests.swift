@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testUsers() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        
        let address =  Address(street: "Road 8", state: "USA", zip: "20620")
        let users = [User(name: "User1", age: 32, address: address)]

        try app.test(.GET, "users", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            
            let decodedUser = try res.content.decode([User].self)
            XCTAssertEqual(decodedUser.first?.name, users.first?.name)
            XCTAssertEqual(decodedUser.first?.age, users.first?.age)
            
            XCTAssertEqual(decodedUser.first?.address.state, users.first?.address.state)
            XCTAssertEqual(decodedUser.first?.address.street, users.first?.address.street)
            XCTAssertEqual(decodedUser.first?.address.zip, users.first?.address.zip)
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
