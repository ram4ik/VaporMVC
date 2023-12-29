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
    }
    
    func getAllUsers(request: Request) throws -> String {
        return "All Users"
    }
}
