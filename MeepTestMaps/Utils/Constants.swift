//
//  Constants.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit

struct Position {
  var lat: Double
  var lon: Double
}

final class Constants {
  static let googleMapsApiKey = "AIzaSyAEt6k_jNJ1aFJYXByVltHqFhDTVllbSNQ"
  static let baseUrl = "https://apidev2.meep.me"
  static let params = ["":""]
  static let makerColors = [UIColor.red, UIColor.orange, UIColor.blue, UIColor.gray, UIColor.green, UIColor.purple, UIColor.yellow, UIColor.magenta, UIColor.brown]
  static let initialPosition = Position(lat: 38.711046, lon: -9.160096)
}
