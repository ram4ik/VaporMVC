//
//  File.swift
//  
//
//  Created by test on 29.12.2023.
//

import Foundation
import Vapor

struct UserController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: getAllUsers)
        
        users.group(":userId") { user in
            user.get(use: show)
        }
    }
    
    func getAllUsers(request: Request) throws -> [User] {
        let address =  Address(street: "Road 8", state: "USA", zip: "20620")
        let users = [User(name: "User1", age: 32, address: address)]
        
        return users
    }
    
    func show(request: Request) throws -> String {
        guard let userId = request.parameters.get("userId") as String? else {
            throw Abort(.badRequest)
        }
        return "Show user for user id = \(userId)"
    }
}
