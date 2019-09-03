//
//  RestaurantViewController.swift
//  Kateruma
//
//  Created by Johanes Steven on 03/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
  
  var restaurant: Restaurant?
  
  @IBOutlet weak var restoranTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "CategoryDetail"
    self.updateViewControllerWithDetails()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  func updateViewControllerWithDetails() {
    if let restaurant = self.restaurant {
      let imageCounter = restaurant.photograph.count
      var imageArray = [UIImage]()
      for i in 0..<imageCounter {
        imageArray.append(UIImage(named: restaurant.photograph[i])!)
      }
      restaurantImageView.image = imageArray[0]
      
      self.restaurantNameLabel.text = restaurant.name
      //self.restaurantImageView.image = UIImage(named: imageTitle)
    }
  }

}
