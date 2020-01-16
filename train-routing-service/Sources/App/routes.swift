import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    
    struct PostgreSQLVersion: Codable {
        let version: String
    }

    router.get("sql") { req in
        return req.withPooledConnection(to: .psql) { conn in
            return conn.raw("SELECT version()")
                .all(decoding: PostgreSQLVersion.self)
        }.map { rows in
            return rows[0].version
        }
    }
    
    
    // Basic "It works" example
    router.get("/") { req in
        return "OK"
    }
    
    router.group("routing") { routing in
        let trainRouting = TrainRouteController()
        routing.get("rail", use: trainRouting.get)
        
        
        routing.get("road") { request in
            return "This will serve as a road routing service at some point"
        }
        
        routing.get("foot") { request in
            return "This will serve as a foot routing service at some point"
        }
        
        routing.get("water") { request in
            return "This will serve as a water routing service at some point"
        }
    }
}
