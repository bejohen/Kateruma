//
//  PageCell.swift
//  Onboarding Food App
//
//  Created by Marcell Julienne on 01/09/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    var page: Page? {
        didSet{
//            print(page?.imageName)
            guard let unwrappedPage = page else {return}
            
            mainImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let textView = UITextView()
            let attributedText =  NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor:UIColor.lightbrown])
            
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightbrown]))
            
            
            textDescriptionView.attributedText = attributedText
            textDescriptionView.textAlignment = .center
            textDescriptionView.backgroundColor = .mainColour
        }
    }
    
    private let mainImageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Artboard – 1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let textDescriptionView: UITextView = {
        let textView = UITextView()
        let attributedText =  NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun activities? Don't wait any longer! We hope to see you in our stores soon. Let's go hooraaay", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        //        topImageContainerView.backgroundColor = .blue
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
    
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(mainImageView)
        mainImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.75).isActive = true
        
        addSubview(textDescriptionView)
        textDescriptionView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        textDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        textDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        textDescriptionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
