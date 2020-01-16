//
//  RouteRequest.swift
//  App
//
//  Created by Jeroen - Second Coming on 16/01/2020.
//

import Foundation


//struct SimpleRouteRequest {
//    from
//}

struct RouteRequest {
    var from: RouteRequestLocation
    var to: RouteRequestLocation
    var options: RouteRequestOptions
}


struct RouteRequestLocation {
    var x: Float;
    var y: Float;
}


struct RouteRequestOptions {
    
}
