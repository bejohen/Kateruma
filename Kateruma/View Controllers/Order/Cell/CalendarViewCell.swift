//
//  CalendarViewCell.swift
//  CalendarCocoa
//
//  Created by Rezli Arian Perdana on 28/08/19.
//  Copyright © 2019 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class CalendarViewCell : UITableViewCell {
    
    //var nama: String = "abc"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var makananLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var pemilikBankLabel: UILabel!
    @IBOutlet weak var nomorRekeningLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var detail1Label: UILabel!
    @IBOutlet weak var jumlah1Label: UILabel!
    @IBOutlet weak var detail2Label: UILabel!
    @IBOutlet weak var jumlah2Label: UILabel!
    @IBOutlet weak var paymentStatusLabel: UILabel!
    @IBOutlet weak var gambar: UIImageView!
    
    
    func setupNama(nama: String) {
        titleLabel.text = nama
    }
    func setupMakanan(makanan: String){
      let attributedText = NSMutableAttributedString(string: "Makanan siap pada pukul ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .light)])
      attributedText.append(NSMutableAttributedString(string: makanan, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .medium)]))
      makananLabel.attributedText = attributedText
    }
    func setupStatus(status: String){
      
      let attributedText = NSMutableAttributedString(string: "Status kirim: ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .light)])
      attributedText.append(NSMutableAttributedString(string: status, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .medium)]))
      statusLabel.attributedText = attributedText
    }
    func setupBank(bank: String){
      bankLabel.text = bank
      bankLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    func setupPemilikBank(pemilikBank: String){
      pemilikBankLabel.text = pemilikBank
      pemilikBankLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    func setupNomorRekening(nomorRekening: String){
        nomorRekeningLabel.text = nomorRekening
      nomorRekeningLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    func setupTotal(total: String){
        totalLabel.text = total
      totalLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    func setupDetail1(detail1: String){
        detail1Label.text = detail1
    }
    func setupJumlah1(jumlah1: String){
        jumlah1Label.text = jumlah1
    }
    func setupDetail2(detail2: String){
        detail2Label.text = detail2
    }
    func setupJumlah2(jumlah2: String){
        jumlah2Label.text = jumlah2
    }
    func setupPaymentStatus(paymentStatus: String){
        paymentStatusLabel.text = paymentStatus
        paymentStatusLabel.text = ""
        //paymentStatusLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    func setupGambar(nama: String){
        gambar.image = UIImage(named: nama)
        gambar.layer.masksToBounds = true
        gambar.layer.borderColor = UIColor.black.cgColor
        gambar.layer.cornerRadius = (gambar.frame.width/2)
    }
    
}
