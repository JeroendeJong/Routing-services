import Vapor
import PostgreSQL

struct PostgreSQLVersion: Codable {
    let version: String
}

class TrainRouteController {

    func get(_req: Request) throws -> Response {
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
    
    
    func post(_ req: Request) throws -> Response {

        print(req.parameters.values)
        return req.withPooledConnection(to: .psql) { conn in
          return conn.raw("""
              with
              to_vertex_id as (
                  SELECT id
                  FROM railway_vertices_pgr
                  ORDER BY the_geom <-> ST_GeometryFromText('POINT(52 1)',4326)
                  LIMIT 1
              ),
              from_vertex_id as (
                  SELECT id
                  FROM railway_vertices_pgr
                  ORDER BY the_geom <-> ST_GeometryFromText('POINT(52 1)',4326)
                  LIMIT 1
              )

              SELECT railway.* from pgr_dijkstra(
                  'SELECT gid as id, source, target, cost FROM railway',
                  (select id::integer from from_vertex_id),
                  (select id::integer from to_vertex_id),
                  false,
                  false
              ) join railway on (railway.gid = id2)
            """
          ).all(decoding: PostgreSQLVersion.self)
        }.map { rows in
            print(rows)
            return ""
        }
    }
}
