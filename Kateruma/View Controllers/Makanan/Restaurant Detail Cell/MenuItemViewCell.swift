//
//  MenuItemViewCell.swift
//  Kateruma
//
//  Created by Johanes Steven on 05/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import Foundation
import UIKit

class MenuItemViewCell: UITableViewCell {
  
  @IBOutlet weak var menuImage: UIImageView!
  @IBOutlet weak var itemName: UILabel!
  @IBOutlet weak var itemDescription: UILabel!
  
  class var CustomCell : MenuItemViewCell {
    let cell = Bundle.main.loadNibNamed("MenuItemViewCell", owner: self, options: nil)?.last
    return cell as! MenuItemViewCell
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.backgroundColor = UIColor.white
 
    self.menuImage.contentMode = UIView.ContentMode.scaleAspectFill
    self.menuImage.layer.cornerRadius = 4.0
    self.menuImage.layer.shadowRadius = 1.0
    self.menuImage.layer.shadowOpacity = 0.2
  }
  
  func updateCellWithImage(product: Product) {
    self.itemName.text = product.productName
    self.itemDescription.text = product.productDescription
    self.menuImage.image = UIImage(named: product.photograph[0])
  }
  
}
