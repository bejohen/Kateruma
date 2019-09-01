//
//  ItemCollectionCell.swift
//  LearnAdvanceTableView
//
//  Created by Johanes Steven on 26/08/19.
//  Copyright © 2019 bejohen. All rights reserved.
//

import UIKit

class ItemCollectionCell: UICollectionViewCell {
  
  @IBOutlet weak var cellImageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var productPriceLabel: UILabel!
  @IBOutlet weak var rateLabel: UILabel!
  @IBOutlet weak var rateBorder: UIView!
  
  var id: Int?
  var products: Product?
  var cellImageName:String?
  class var CustomCell : ItemCollectionCell {
    let cell = Bundle.main.loadNibNamed("ItemCollectionCell", owner: self, options: nil)?.last
    return cell as! ItemCollectionCell
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    self.backgroundColor = UIColor.white
    self.layer.cornerRadius = 10.0
    
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    self.layer.shadowRadius = 3.0
    self.layer.shadowOpacity = 0.2
    self.layer.masksToBounds = false
    self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    
    self.rateBorder.layer.cornerRadius = 4.0
    self.rateBorder.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    self.rateBorder.layer.shadowRadius = 1.0
    self.rateBorder.layer.shadowOpacity = 0.2
    
    self.cellImageView.contentMode = UIView.ContentMode.scaleAspectFill
    self.cellImageView.layer.cornerRadius = 10.0
  }
  
  func updateCellWithImage(product: Product) {
    self.productNameLabel.text = product.productName
    self.productPriceLabel.text = "Rp.\(product.price)"
    self.cellImageView.image = UIImage(named: product.productName)
    self.rateLabel.text = product.ratingTotal
  }
  
}

