
struct Feature: Codable {
    let type: String =  "Feature"
    var geometry: FeatureGeometry
    var properties: [String: String]?
}

struct FeatureGeometry: Codable {
    var type: FeatureGeometryType
    var coordinates: [Float]
}

public enum FeatureGeometryType: String, Codable {
    case Point
    case Polygon
    case LineString
}

public struct RouteResponse: Codable {
    var geometry: [Feature]
    var metadata: String?
    
    init(geometry: [Feature], metadata: String?) {
        self.geometry = geometry
        self.metadata = metadata
    }
}
