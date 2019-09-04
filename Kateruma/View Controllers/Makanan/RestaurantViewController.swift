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
    self.configureTableView()
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
      //restaurantImageView.image = imageArray[0]
      
      //self.restaurantNameLabel.text = restaurant.name
      //self.restaurantImageView.image = UIImage(named: imageTitle)
    }
  }
  
  func configureTableView() {
    
    restoranTableView.rowHeight = 310
    restoranTableView.estimatedRowHeight = 310
    restoranTableView.delegate = self
    restoranTableView.dataSource = self
    restoranTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
    restoranTableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
    
    restoranTableView.register(UINib(nibName: "RestaurantDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "RestaurantDetailTableViewCell")
  }

}

extension RestaurantViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      return 256
    case 1:
      return 280
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return 1
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
      let image = (self.restaurant?.photograph)!
      cell.updateCellWith(image: image)
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantDetailTableViewCell", for: indexPath) as! RestaurantDetailTableViewCell
      cell.updateCell(restaurant: restaurant!)
      return cell
    default:
      return UITableViewCell()
    }
  }
}

