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

struct NetworkManager: Network {
  let provider = MoyaProvider<WeatherApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
}
