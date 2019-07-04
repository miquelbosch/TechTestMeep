//
//  MapView.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit
import GoogleMaps

class MapView: UIView {
  @IBOutlet weak var mapView: GMSMapView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initialPosition()
  }
  
  private func initialPosition() {
    let location = GMSCameraPosition(latitude: Constants.initialPosition.lat, longitude: Constants.initialPosition.lon, zoom: 16)
    mapView.animate(to: location)
  }

}
