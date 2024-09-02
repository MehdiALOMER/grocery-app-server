//
//  File.swift
//  
//
//  Created by Mehdi on 30.08.2024.
//

import Fluent

struct CreateUsersTableMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema("users")
            .id()
            .field("username", .string, .required).unique(on: "username")
            .field("password",.string, .required)
            .create()
    }
    
    // UNDO
    func revert(on database: Database) async throws {
        try await database.schema("users").delete()
    }
}


// swift run App migrate / swift run App migrate --revert

