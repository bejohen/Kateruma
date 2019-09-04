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
  
  @IBOutlet weak var ownerNameLabel: UILabel!
  
  @IBOutlet weak var buttonIkuti: UIButton!
  
  @IBOutlet weak var buttonTanya: UIButton!
  
  var resto: Restaurant?
  
  class var CustomCell : RestaurantDetailTableViewCell {
    let cell = Bundle.main.loadNibNamed("RestaurantDetailTableViewCell", owner: self, options: nil)?.last
    return cell as! RestaurantDetailTableViewCell
  }
  
  override func awakeFromNib() {
    ownerImageView.layer.masksToBounds = true
    ownerImageView.layer.cornerRadius = (ownerImageView.frame.width/2)
    ownerImageView.contentMode = .scaleAspectFill
    
    buttonIkuti.layer.cornerRadius = 6.0
    buttonIkuti.layer.shadowColor = UIColor.black.cgColor
    buttonIkuti.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    buttonIkuti.layer.shadowRadius = 3.0
    buttonIkuti.layer.shadowOpacity = 0.2
    
    buttonTanya.layer.cornerRadius = 6.0
    buttonTanya.layer.shadowColor = UIColor.black.cgColor
    buttonTanya.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    buttonTanya.layer.shadowRadius = 3.0
    buttonTanya.layer.shadowOpacity = 0.2
  }
  
  func updateCell(restaurant: Restaurant) {
    resto = restaurant
    self.restaurantNameLabel.text = restaurant.name
    self.sinceLabel.text = "Since \(restaurant.since)"
    self.descriptionLabel.text = restaurant.restaurantDescription
    //self.descriptionLabel.text = "Selamat datang di dapur saya! Semoga anda semua enjoy dengan makanan yang saya buat. Dijamin uenak!"
    
    self.pengikutLabel.text = "Pengikut 581 | Aktif 11 menit"
    
    self.ongkirLabel.text = "Ongkos kirim: 0 - Rp10.000"
    
    self.ownerImageView.image = UIImage(named: restaurant.ownerPhoto)
    self.ownerNameLabel.text = restaurant.owner
  }
  
}
