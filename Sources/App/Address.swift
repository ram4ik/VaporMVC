//
//  File.swift
//  
//
//  Created by test on 29.12.2023.
//

import Foundation
import Vapor

struct Address: Content {
    let street: String
    let state: String
    let zip: String
}
