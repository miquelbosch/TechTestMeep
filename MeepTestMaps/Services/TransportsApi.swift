//
//  TransportsApi.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import Foundation
import Moya
import Alamofire


enum TransportsApi {
  case transport
}

extension TransportsApi: TargetType {
  var baseURL: URL {
    guard let url = URL(string: Constants.baseUrl) else { fatalError("Invalid URL Transport Api")   }
    return url
  }
  
  var path: String {
    return "/tripplan/api/v1/routers/lisboa/resources"
  }
  
  var method: Alamofire.HTTPMethod {
    return .get
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    return .requestParameters(parameters: Constants.params, encoding: URLEncoding.queryString)
  }
  
  var headers: [String : String]? {
    return nil
  }
}
