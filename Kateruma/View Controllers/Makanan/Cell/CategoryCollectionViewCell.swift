//
//  CategoryCollectionViewCell.swift
//  Kateruma
//
//  Created by Johanes Steven on 06/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var categoryNameLabel: UILabel!
  
  class var CustomCell : CategoryCollectionViewCell {
    let cell = Bundle.main.loadNibNamed("CategoryCollectionViewCell", owner: self, options: nil)?.last
    return cell as! CategoryCollectionViewCell
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
    
    self.imageView.contentMode = UIView.ContentMode.scaleAspectFill
    self.imageView.layer.cornerRadius = 10.0
  }
  
  func updateCellWithImage(category: String) {
    self.imageView.image = UIImage(named: category)
    self.categoryNameLabel.text = category
  }
  
}
