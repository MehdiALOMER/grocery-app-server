import Vapor
import Fluent
import FluentPostgresDriver
import JWT

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    
    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "postgres",
        password: Environment.get("DATABASE_PASSWORD") ?? "postgres",
        database: Environment.get("DATABASE_NAME") ?? "grocerydb",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)
    
    // register migrations (swift run App migrate / swift run App migrate --revert)
    app.migrations.add(CreateUsersTableMigration())
    
    // register the controllers
    try app.register(collection: UserController())
    
    app.jwt.signers.use(.hs256(key: "SECRETKEY"))
    
    // register routes
    try routes(app)
}
