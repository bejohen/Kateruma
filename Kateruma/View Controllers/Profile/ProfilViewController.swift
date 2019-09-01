//
//  ViewController.swift
//  Kateruma
//
//  Created by Christian Widjaja on 29/08/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import UIKit

class ProfilViewController: UIViewController {
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePicture.layer.masksToBounds = true
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.cornerRadius = (profilePicture.frame.width/2)
  }


}

