//
//  CategoryTableViewCell.swift
//  Kateruma
//
//  Created by Johanes Steven on 06/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import Foundation
import UIKit

class CategoryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var CategoryCollectionViewCell: UICollectionView!
  
  let cellReuseId = "CategoryCollectionViewCell"
  
  class var customCell : CategoryTableViewCell {
    let cell = Bundle.main.loadNibNamed("CategoryTableViewCell", owner: self, options: nil)?.last
    return cell as! CategoryTableViewCell
  }
  
  let categories = ["New Item", "Promotion", "Near Me", "Best Sellers", "Loved", "Delivery Promo", "Budget Meal", "Historical", "Best Sellers"]
  
  override func awakeFromNib() {
    //TODO: need to setup collection view flow layout
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.itemSize = CGSize(width: 112, height: 112)
    flowLayout.minimumLineSpacing = 12.0
    flowLayout.minimumInteritemSpacing = 5.0
    self.CategoryCollectionViewCell.collectionViewLayout = flowLayout
    
    //Comment if you set Datasource and delegate in .xib
    self.CategoryCollectionViewCell.dataSource = self
    self.CategoryCollectionViewCell.delegate = self
    CategoryCollectionViewCell.isScrollEnabled = false
    
    let cellNib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    self.CategoryCollectionViewCell.register(cellNib, forCellWithReuseIdentifier: cellReuseId)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as! CategoryCollectionViewCell
    
    let category = self.categories[indexPath.item]
    cell.updateCellWithImage(category: category)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 15, left: 18, bottom: 15, right: 18)
  }
  
}
