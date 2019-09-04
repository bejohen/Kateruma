//
//  ImageCollectionCell.swift
//  Kateruma
//
//  Created by Johanes Steven on 04/09/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  let cellReuseId = "ImageCollectionViewCell"
  
  @IBOutlet weak var imageCollectionView: UICollectionView!
  
  class var customCell : ImageTableViewCell {
    let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self, options: nil)?.last
    return cell as! ImageTableViewCell
  }
  
  
  var imageName: [String] = []
  
//  lazy var pageControlView: UIPageControl = {
//    let pageControl = UIPageControl()
//    pageControl.currentPage = 0
//    pageControl.numberOfPages = imageName.count - 1
//    pageControl.currentPageIndicatorTintColor = .darkGreen
//    pageControl.pageIndicatorTintColor = .mainColourFade
//    return pageControl
//  }()
  
  @IBOutlet weak var pageControlView: UIPageControl!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    //setupBottomControls()
    
    pageControlView.currentPage = 0
    pageControlView.numberOfPages = imageName.count - 1
    pageControlView.currentPageIndicatorTintColor = .mainColour
    pageControlView.pageIndicatorTintColor = .mainColourFade
    
    //TODO: need to setup collection view flow layout
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.itemSize = CGSize(width: 414, height: 256)
    flowLayout.minimumLineSpacing = 0.0
    flowLayout.minimumInteritemSpacing = 10.0
    self.imageCollectionView.collectionViewLayout = flowLayout
    
    //Comment if you set Datasource and delegate in .xib
    self.imageCollectionView.dataSource = self
    self.imageCollectionView.delegate = self
    self.imageCollectionView.isPagingEnabled = true
    
    //setupBottomControls()
    
    let cellNib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    self.imageCollectionView.register(cellNib, forCellWithReuseIdentifier: cellReuseId)
    
    
  }
  
  func updateCellWith(image:[String]) {
    for i in image {
      self.imageName.append(i)
    }
    print(image)
    pageControlView.currentPage = 0
    pageControlView.numberOfPages = image.count
    pageControlView.currentPageIndicatorTintColor = .darkGreen
    pageControlView.pageIndicatorTintColor = .mainColourFade
    
    self.imageCollectionView.reloadData()
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageName.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as? ImageCollectionViewCell
    let image = self.imageName[indexPath.item]
    cell?.updateCellWithImage(image: image)
    return cell!
  }
  
}

extension ImageTableViewCell {
  
  func setupBottomControls(){
    
    let bottomControlsStackView  =  UIStackView(arrangedSubviews: [pageControlView])
    bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomControlsStackView.distribution = .fillEqually
    
    self.addSubview(bottomControlsStackView)
    
    NSLayoutConstraint.activate([
      bottomControlsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
      bottomControlsStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
      bottomControlsStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
      bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
      ])
  }
  
  @objc func handlePrev(){
    let nextIndex = max(pageControlView.currentPage - 1, 0)
    
    let indexPath = IndexPath(item: nextIndex, section: 0)
    
    pageControlView.currentPage = nextIndex
    
    imageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  }
  
  @objc func handleNext(){
    let nextIndex = min(pageControlView.currentPage + 1, imageName.count - 1)
    
    let indexPath = IndexPath(item: nextIndex, section: 0)
    
    print (indexPath)
    
    pageControlView.currentPage = nextIndex
    
    imageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    let x = targetContentOffset.pointee.x
    
    pageControlView.currentPage = Int(x / self.frame.width)
    
    //        print(x, view.frame.width, x / view.frame.width)
  }
}
