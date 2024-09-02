//
//  File.swift
//  
//
//  Created by Mehdi on 1.09.2024.
//

import Foundation
import Vapor

struct RegisterResponseDTO: Content {
    let error: Bool
    var reason: String? = nil
}
