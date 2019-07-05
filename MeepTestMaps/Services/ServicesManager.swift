//
//  ServicesManager.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import GoogleMaps

protocol ServiceManager {
  associatedtype T: TargetType
  var provider: MoyaProvider<T> { get }
}

struct NetworkManager: ServiceManager {
  let provider = MoyaProvider<TransportsApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
  
  func getTransportMarkers(params: [String: String],
                           success scxd: @escaping ([LocationInfo])->(),
                           failure fail: @escaping (ErrorType)->()) {
    provider.request(.transport(params)) { result in
      switch result {
      case let .success(response):
        let data = response.data
        guard let swiftyJSON = JSON(rawValue: data) else {
            fail(.genericError)
            return
        }
        
        scxd(self.mapList(swiftyJSON))
      case .failure:
        fail(.serverError)
      }
    }
  }
  
  private func mapList(_ json: JSON) -> [LocationInfo] {
    var result = [LocationInfo]()
    for (_, object) in json {
      let id = object["id"].stringValue
      let lon = object["x"].doubleValue
      let lat = object["y"].doubleValue
      let name = object["name"].stringValue
      let model = object["model"].stringValue
      let companyZoneId = object["companyZoneId"].intValue
      let position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
      let marker = GMSMarker(position: position)
      marker.title = name
      marker.snippet = model
      
      let new = LocationInfo(id: id, companyZoneId: companyZoneId, name: name, model: model, maker: marker)
      result.append(new)
    }
    return result
  }
}
