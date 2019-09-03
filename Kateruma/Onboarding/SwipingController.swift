//
//  SwipingController.swift
//  Onboarding Food App
//
//  Created by Marcell Julienne on 01/09/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainColour = UIColor(red: 42/255, green: 56/255, blue: 10/255, alpha: 1)
    static var mainColourFade = UIColor(red: 126/255, green: 141/255, blue: 93/255, alpha: 1)
    static var darkGreen = UIColor(red: 29/255, green: 39/255, blue: 7/255, alpha: 1)
    static var lightbrown = UIColor(red: 250/255, green: 244/255, blue: 218/255, alpha: 1)
}

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "buatkue", headerText: "Selamat datang di Kateruma!", bodyText: "Kateruma merupakan aplikasi untuk membantu anda menemukan makanan rumah yang dibuat langsung dari dapur pribadi mereka."),
        Page(imageName: "makankeluarga", headerText: "Kreasikan menu anda dan keluarga", bodyText: "Tentukan waktu pengiriman makanan anda secara fleksibel untuk kreasi makanan anda setiap harinya."),
        Page(imageName: "sepeda", headerText: "Biaya kirim tetap terjangkau", bodyText: "Untuk menjamin biaya kirim tetap rendah, kami membantu anda menemukan makanan rumah terdekat dari jarak yang anda tentukan."),
        Page(imageName: "dapur", headerText: "Sistem penilaian dan rekomendasi dapur yang terpercaya", bodyText: "Dengan sistem penilaian dan rekomendasi, kami membantu anda menemukan makanan rumah yang paling cocok untuk selera anda."),
        Page(imageName: "dapur", headerText: "Sistem penilaian dan rekomendasi dapur yang terpercaya", bodyText: "Dengan sistem penilaian dan rekomendasi, kami membantu anda menemukan makanan rumah yang paling cocok untuk selera anda.")

    ]
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.lightbrown, for: .normal)
        
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.lightbrown, for: .normal)
        
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    lazy var pageControlView: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count - 1
        pageControl.currentPageIndicatorTintColor = .darkGreen
        pageControl.pageIndicatorTintColor = .mainColourFade
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        
        collectionView?.backgroundColor = .mainColour
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
      
    }
}
