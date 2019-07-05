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
  case transport([String : String])
}

extension TransportsApi: TargetType {
  var baseURL: URL {
    guard let url = URL(string: Constants.baseUrl) else { fatalError("Invalid URL Transport Api") }
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
    switch self  {
    case .transport(let params):
      return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
//    default:
//      return .requestParameters(parameters: Constants.params, encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    return nil
  }
}
