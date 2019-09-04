//
//  ImageCollectionViewCell.swift
//  Kateruma
//
//  Created by Johanes Steven on 04/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import Foundation
import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  
  
  @IBOutlet weak var imageView: UIImageView!
  
  var id: Int?
  var products: Product?
  var cellImageName:String?
  
  class var CustomCell : ImageCollectionViewCell {
    let cell = Bundle.main.loadNibNamed("ImageCollectionViewCell", owner: self, options: nil)?.last
    return cell as! ImageCollectionViewCell
  }
  override func awakeFromNib() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
  }
  
  func updateCellWithImage(image: String) {
    self.imageView.image = UIImage(named: image)
  }
}
