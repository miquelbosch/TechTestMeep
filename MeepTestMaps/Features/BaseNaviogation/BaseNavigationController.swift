//
//  BaseNavigationController.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    setUpNabBar()
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setUpNabBar()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUpNabBar()
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  func setUpNabBar() {
    self.navigationBar.tintColor = UIColor.red
    self.navigationBar.barTintColor = .mainColor
    self.navigationBar.layer.masksToBounds = false
    self.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
    self.navigationBar.layer.shadowOpacity = 0.8
    self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    self.navigationBar.layer.shadowRadius = 2
  }
  
}
