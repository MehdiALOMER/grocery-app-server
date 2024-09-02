//
//  File.swift
//  
//
//  Created by Mehdi on 2.09.2024.
//

import Foundation
import Vapor

struct LoginResponseDTO: Content {
    let error: Bool
    var reason: String? = nil
    let token: String?
    let userId: UUID
}
