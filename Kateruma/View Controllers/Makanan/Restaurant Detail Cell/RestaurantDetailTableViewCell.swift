//
//  RestaurantDetailTableViewCell.swift
//  Kateruma
//
//  Created by Johanes Steven on 04/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {
  
  @IBOutlet weak var restaurantNameLabel: UILabel!
  
  @IBOutlet weak var sinceLabel: UILabel!
  
  @IBOutlet weak var descriptionLabel: UILabel!
  
  @IBOutlet weak var pengikutLabel: UILabel!
  
  @IBOutlet weak var ongkirLabel: UILabel!
  
  @IBOutlet weak var ownerImageView: UIImageView!
  
  //var restaurant: Restaurant?
  
  class var CustomCell : RestaurantDetailTableViewCell {
    let cell = Bundle.main.loadNibNamed("RestaurantDetailTableViewCell", owner: self, options: nil)?.last
    return cell as! RestaurantDetailTableViewCell
  }
  
  func updateCell(restaurant: Restaurant) {
    self.restaurantNameLabel.text = restaurant.name
    self.sinceLabel.text = "Since 2019"
    self.descriptionLabel.text = "Selamat datang di dapur saya! Semoga anda semua enjoy dengan makanan yang saya buat. Dijamin uenak!"
    
    self.pengikutLabel.text = "Pengikut 581 | Aktif 11 menit"
    
    self.ongkirLabel.text = "Ongkos kirim: 0 - Rp10.000"
//    self.cellImageView.image = UIImage(named: product.productName)
//    self.rateLabel.text = product.ratingTotal
  }
  
}
