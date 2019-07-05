//
//  MapScreenViewModel.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import Foundation
import RxSwift
import GoogleMaps

class MapScreenViewModel {
  private var networkManager = NetworkManager()
  public var tableDataList = PublishSubject<[LocationInfo]>()
  public let loadingManager = PublishSubject<LoadingType>()
  lazy var loadingObservable: Observable<LoadingType> = self.loadingManager.asObservable()
  public let errorManager = PublishSubject<ErrorType>()
  
  public func fetchTransportList(_ params: [String: String]) {
    self.loadingManager.onNext(.loadingOn)
    networkManager.getTransportMarkers(params: params, success: { jsonResponse in
      self.loadingManager.onNext(.loadingOff)
      self.tableDataList.onNext(jsonResponse)
      
    }) { errorType in
      self.loadingManager.onNext(.loadingOff)
      self.errorManager.onNext(.serverError)
    }
  }
}
