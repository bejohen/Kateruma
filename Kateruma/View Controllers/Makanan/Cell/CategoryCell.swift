//
//  CategoryCell.swift
//  LearnAdvanceTableView
//
//  Created by Johanes Steven on 24/08/19.
//  Copyright © 2019 bejohen. All rights reserved.
//

import UIKit

protocol ItemCollectionCellDelegate:class {
  func collectionView(collectioncell:ItemCollectionCell?, didTappedInTableview TableCell:CategoryCell)
}

class CategoryCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  weak var cellDelegate:ItemCollectionCellDelegate? //define delegate
  
  
  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var descLabel: UILabel!
  @IBOutlet weak var categoryCollectionView: UICollectionView!
  
  var restaurants: Restaurant?
  
  //var aCategory:ImageCategory?
  let cellReuseId = "ItemCollectionCell"
  
  class var customCell : CategoryCell {
    let cell = Bundle.main.loadNibNamed("CategoryCell", owner: self, options: nil)?.last
    return cell as! CategoryCell
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    //TODO: need to setup collection view flow layout
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.itemSize = CGSize(width: 126, height: 205)
    flowLayout.minimumLineSpacing = 20.0
    flowLayout.minimumInteritemSpacing = 10.0
    self.categoryCollectionView.collectionViewLayout = flowLayout
    
    //Comment if you set Datasource and delegate in .xib
    self.categoryCollectionView.dataSource = self
    self.categoryCollectionView.delegate = self
    
    descLabel.numberOfLines = 0
    
    let cellNib = UINib(nibName: "ItemCollectionCell", bundle: nil)
    self.categoryCollectionView.register(cellNib, forCellWithReuseIdentifier: cellReuseId)

  }
  
  func updateCellWith(restaurant:Restaurant) {
    self.restaurants = restaurant
    print(self.restaurants!)
    self.categoryCollectionView.reloadData()
  }
  
  //MARK: Collection view datasource and Delegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as? ItemCollectionCell
    self.cellDelegate?.collectionView(collectioncell: cell, didTappedInTableview: self)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let categoryItems = self.restaurants?.products {
      return categoryItems.count
    } else {
      return 0
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as? ItemCollectionCell
    if let product = self.restaurants?.products[indexPath.item] {
      cell?.updateCellWithImage(product: product)
      cell?.id = product.restaurantID
    }
    return cell!
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
  }
  
}
