//
//  HomeViewController.swift
//  Kateruma
//
//  Created by Johanes Steven on 01/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import Foundation
import UIKit

class MakananViewController: UIViewController {
  
  @IBOutlet weak var menuItemTableView: UITableView!
  
  var sections = ["category", "item"]
  
  var restaurants: [Restaurant] = []
  
  var onboardingStatus = false
  
  var window : UIWindow?
  
  //var ipPort = "10.60.40.52"
  //var ipPort = "10.60.49.157"
  var ipPort = "127.0.0.1"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if onboardingStatus {
      
      window = UIWindow()
      window?.makeKeyAndVisible()
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      let swipingController = SwipingController(collectionViewLayout: layout)
      window?.rootViewController = swipingController
    }
    
    self.navigationController?.isNavigationBarHidden = true
    
    getRestaurantData {
      self.configureTableView()
    }
  }
  
  func getRestaurantData(completionHandler: @escaping () -> Void) {
    let url = "http://\(ipPort):3000/restaurants"
    guard let restoUrl = URL(string: url) else { return }
    URLSession.shared.dataTask(with: restoUrl) { (data, response
      , error) in
      guard let data = data else { return }
      do {
        let decoder = JSONDecoder()
        self.restaurants = try decoder.decode([Restaurant].self, from: data)
        for restaurant in self.restaurants {
          print(restaurant.address)
        }
        
        //let resto = restaurant.restaurants
        DispatchQueue.main.async {
          completionHandler()
        }
      } catch let err {
        print("Err", err)
      }
      }.resume()
  }
  
  func configureTableView() {
    
    menuItemTableView.rowHeight = 310
    menuItemTableView.estimatedRowHeight = 310
    menuItemTableView.delegate = self
    menuItemTableView.dataSource = self
    menuItemTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
    menuItemTableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
  }
}

extension MakananViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      return 310
    case 1:
      return 310
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //guard let searchResults = searchResults else { return 0 }
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
      let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
      let resto = self.restaurants[0]
      cell.updateCellWith(restaurant: resto)
      cell.cellDelegate = self
      
      cell.headerLabel.text = "Jarak berjalan"
      
      let attributedText = NSMutableAttributedString(string: "Ayo ambil sendiri, itung-itung olahraga.\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
      attributedText.append(NSMutableAttributedString(string: "Biaya kirim gratis", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
      
      //cell.descLabel.numberOfLines = 2
      cell.descLabel.attributedText = attributedText
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
      let resto = self.restaurants[1]
      cell.updateCellWith(restaurant: resto)
      cell.cellDelegate = self
      
      cell.headerLabel.text = "Makanan rumah dekat anda"
      
      let attributedText = NSMutableAttributedString(string: "Jarak dekat ke tempat anda. Tidak perlu\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
      attributedText.append(NSMutableAttributedString(string: "nunggu terlalu lama!", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
      
      //cell.descLabel.numberOfLines = 2
      cell.descLabel.attributedText = attributedText
      
      return cell
    default:
      return UITableViewCell()
    }
  }
  
}

extension MakananViewController:ItemCollectionCellDelegate {
  func collectionView(collectioncell: ItemCollectionCell?, didTappedInTableview TableCell: CategoryCell) {
    if let cell = collectioncell, let selCategory = TableCell.restaurants {
      if let restaurantId = cell.id {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailController = storyBoard.instantiateViewController(withIdentifier:"RestaurantViewController") as? RestaurantViewController
        detailController?.restaurant = restaurants[restaurantId]
        self.navigationController?.pushViewController(detailController!, animated: true)

      }
    }
  }
}

