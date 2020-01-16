import Vapor


class TrainRouteController {
    
    func get(_ req: Request) throws -> Response {
        
        let feature = Feature(
            geometry: FeatureGeometry(
                type: FeatureGeometryType.LineString,
                coordinates: [0.0, 0.1]
            ),
            properties: nil
        )
        
        
        let responseJSON = RouteResponse(geometry: [feature, feature], metadata: nil)
        
        let response = Response(http: HTTPResponse(status: .ok), using: req)
        try response.content.encode(responseJSON, as: MediaType.json)
        
       return response
   }
}
