//
//  MapScreenViewModel.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import Foundation
import RxSwift

class MapScreenViewModel {
  private var networkManager = NetworkManager()
  public var tableDataList = PublishSubject<[LocationInfo]>()
  
  
  public func fetchTransportList() {
    networkManager.getTransportMarkers(success: { jsonResponse in
      //Pintar mapa
      
    }) { errorType in
      // pintar error
    }
  }
}
