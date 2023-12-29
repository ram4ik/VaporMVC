//
//  File.swift
//  
//
//  Created by test on 29.12.2023.
//

import Foundation
import Vapor

struct User: Content {
    let name: String
    let age: Int
    let address: Address
}
