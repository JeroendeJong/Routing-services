import Vapor

public func routes(_ router: Router) throws {
    
    router.get("/") { req in
        return "OK"
    }
    
    router.group("routing") { routing in
        let trainRouting = TrainRouteController()
        routing.get("rail", use: trainRouting.get)
        routing.post("rail", use: trainRouting.post)
        
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
