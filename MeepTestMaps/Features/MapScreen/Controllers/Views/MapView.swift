//
//  MapView.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit
import GoogleMaps

class MapView: UIView, CLLocationManagerDelegate, GMSMapViewDelegate {
  @IBOutlet weak var mapView: GMSMapView!
  public var dataSourceMapDelegate: DataSourceMapDelegate!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    initialPosition()
  }
  
  private func initialPosition() {
    let location = GMSCameraPosition(latitude: Constants.initialPosition.lat, longitude: Constants.initialPosition.lon, zoom: 16)
    mapView.animate(to: location)
    mapView.delegate = self
  }
  
  public func setMakers(_ list: [LocationInfo]) {
    var dictColors = createDictColors(list)
    mapView.clear()
    
    _ = list.map {  $0.maker.map = mapView
      $0.maker.icon =  dictColors[$0.companyZoneId]
    }
  }
  
  private func createDictColors(_ list: [LocationInfo]) -> [Int: UIImage] {
    var dictColors = [Int: UIImage]()
    var count = 0
    let totalGroups = list.map{ $0.companyZoneId }
    
    var uniqueId = Array(Set(totalGroups))
    
    uniqueId.sort { (element1, element2) -> Bool in
      element1 < element2
    }
    
    for element in uniqueId {
      dictColors[element] = GMSMarker.markerImage(with: Constants.makerColors[count])
      count += 1
    }
    return dictColors
  }
  
  func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//    print("New Center position")
//    let latitude = mapView.camera.target.latitude
//    let longitude = mapView.camera.target.longitude
//    let centerMapCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let newMapPosition = mapView.projection.visibleRegion()
    
    let bottomLeft: CLLocationCoordinate2D = newMapPosition.nearLeft
    let upperRight: CLLocationCoordinate2D = newMapPosition.farRight

    dataSourceMapDelegate.getData(lowerLeftLatLon: transformToString(bottomLeft), upperRightLatLon: transformToString(upperRight))
    //delegate to change position
  }
  
  func transformToString(_ coordinate: CLLocationCoordinate2D) -> String {
    return "\(coordinate.latitude),\(coordinate.longitude)"
  }
}

