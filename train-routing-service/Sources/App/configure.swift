import PostgreSQL
import Vapor

public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    
    try services.register(PostgreSQLProvider())
    
    let postgresql = PostgreSQLDatabase(config: PostgreSQLDatabaseConfig(
        hostname: "localhost",
        port: 5432,
        username: "postgres",
        database: "",
        password: nil,
        transport: .cleartext // because security is overrated.
    ))

    var databases = DatabasesConfig()
    databases.add(database: postgresql, as: .psql)
    services.register(databases)
    

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

}
