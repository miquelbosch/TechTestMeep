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

protocol ServiceManager {
  associatedtype T: TargetType
  var provider: MoyaProvider<T> { get }
}

struct NetworkManager: ServiceManager {
  let provider = MoyaProvider<TransportsApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
  
  func getTransportMarkers(success scxd: @escaping (JSON)->(),
                           failure fail: @escaping (ErrorType)->()) {
    provider.request(.transport) { result in
      switch result {
      case let .success(response):
        let data = response.data
        guard let swiftyJSON = JSON(rawValue: data) else {
            fail(.genericError)
            return
        }
        scxd(swiftyJSON)
      case .failure:
        fail(.serverError)
      }
    }
  }
  
  
}
