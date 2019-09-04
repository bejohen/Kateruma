//
//  MenuViewCell.swift
//  Kateruma
//
//  Created by Johanes Steven on 05/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var menuItemTableView: UITableView!
  
  let cellReuseId = "MenuItemViewCell"
  
  var products: [Product] = []
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.menuItemTableView.dataSource = self
    self.menuItemTableView.delegate = self
    menuItemTableView.rowHeight = 81
    
    let cellNib = UINib(nibName: "MenuItemViewCell", bundle: nil)
    self.menuItemTableView.register(cellNib, forCellReuseIdentifier: cellReuseId)
    
  }
  
  func updateCellWith(product:[Product]) {
    self.products = product
    print(self.products)
    self.menuItemTableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! MenuItemViewCell
    let product = self.products[indexPath.item]
    cell.updateCellWithImage(product: product)
    return cell
  }
  
  
}
