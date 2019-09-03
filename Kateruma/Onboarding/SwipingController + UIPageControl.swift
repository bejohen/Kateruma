//
//  SwipingController + UIPageControl.swift
//  Onboarding Food App
//
//  Created by Marcell Julienne on 01/09/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import UIKit

extension SwipingController{
    
    @objc func handlePrev(){
        let nextIndex = max(pageControlView.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        
        pageControlView.currentPage = nextIndex
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handleNext(){
      let nextIndex = min(pageControlView.currentPage + 1, pages.count - 1)
        
      let indexPath = IndexPath(item: nextIndex, section: 0)
      
      print (indexPath)
      
      pageControlView.currentPage = nextIndex
        
      collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    func setupBottomControls(){
        
        let bottomControlsStackView  =  UIStackView(arrangedSubviews: [previousButton, pageControlView, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControlView.currentPage = Int(x / view.frame.width)
        
        //        print(x, view.frame.width, x / view.frame.width)
    }
}
