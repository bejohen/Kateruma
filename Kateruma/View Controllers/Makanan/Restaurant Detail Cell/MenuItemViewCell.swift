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
  @IBOutlet weak var buttonPesan: UIButton!
  @IBOutlet weak var rateLabel: UILabel!
  
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
    self.menuImage.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    
    self.buttonPesan.layer.cornerRadius = 4.0
    self.buttonPesan.layer.shadowRadius = 1.0
    self.buttonPesan.layer.shadowOpacity = 0.2
    self.buttonPesan.layer.shadowOffset = CGSize(width: 0, height: 2.0)
  }
  
  func updateCellWithImage(product: Product) {
    self.itemName.text = product.productName
    self.itemDescription.text = product.productDescription
    self.menuImage.image = UIImage(named: product.photograph[0])
    let price = product.price
    let x = price.formattedWithSeparator
    self.rateLabel.text = "\(product.ratingTotal) | Rp\(x)"
  }
  
}

extension Formatter {
  static let withSeparator: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
    return formatter
  }()
}

extension BinaryInteger {
  var formattedWithSeparator: String {
    return Formatter.withSeparator.string(for: self) ?? ""
  }
}
