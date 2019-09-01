//
//  SecondViewController.swift
//  Food App
//
//  Created by Marcell Julienne on 27/08/19.
//  Copyright © 2019 Marcell Julienne. All rights reserved.
//

import UIKit

class FirstTimeRegistrationViewController: UIViewController {
    @IBOutlet weak var buttonDaftar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        buttonDaftar.layer.cornerRadius = 5
    }
    
    func assignbackground(){
        let background = UIImage(named: "kitchen")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
  @IBAction func buttonBackTapped(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
}
