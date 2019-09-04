//
//  ViewController.swift
//  CalendarCocoa
//
//  Created by Rezli Arian Perdana on 28/08/19.
//  Copyright © 2019 Apple Developer Academy. All rights reserved.
//

import UIKit
import FSCalendar

class OrderViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {

  @IBOutlet weak var pesananTableView: UITableView!
  
    fileprivate weak var calendar: FSCalendar!
    
    //to tell the default format for calendar is "yyyy/MM/dd"
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
  
    var dataTanggal: [Pesanan] = []

    //Fake Event
    var datesWithEvent = ["2019/09/19"]
    
    //for FilledGreyCircle and GreenCircle event on Calendar
    let borderDefaultColors = ["2019/09/17": UIColor.init(cgColor: #colorLiteral(red: 0.4039215686, green: 0.537254902, blue: 0.1019607843, alpha: 1)), "2019/09/19": UIColor.init(cgColor: #colorLiteral(red: 0.4039215686, green: 0.537254902, blue: 0.1019607843, alpha: 1)), "2019/09/18": UIColor.init(cgColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]
    let fillDefaultColors = ["2019/09/18": UIColor.init(cgColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
  
    //to receive DB from JSON based on filtered date
    func getPesananDataByDate(date: String, completionHandler: @escaping () -> Void) {
        let url = "http://127.0.0.1:3001/pesanan?tanggal=\(date)"
        guard let restoUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: restoUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                self.dataTanggal = try decoder.decode([Pesanan].self, from: data)
                for pesanan in self.dataTanggal {
                    print(pesanan.date)
                }
              
                DispatchQueue.main.async {
                    completionHandler()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
    //to give little dot event on Calendar
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        
        let dateString = self.dateFormatter.string(from: date)
        
        if self.datesWithEvent.contains(dateString) {
            return 1
        }
        return 0
    }
    
    //to assign Circle event on Calendar
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderDefaultColorFor date: Date) -> UIColor? {
        let key = self.dateFormatter.string(from: date)
        if let color = self.borderDefaultColors[key] {
            return color
        }
        return appearance.borderDefaultColor
    }
    
    //to assign FilledCircle event on Calendar
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let key = self.dateFormatter.string(from: date)
        if let color = self.fillDefaultColors[key] {
            return color
        }
        return nil
    }
    
    //to receive data when selecting date on Calendar
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.dateFormatter.string(from: date))")
        let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
        print("selected dates is \(selectedDates)")
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
      
        dataTanggal.removeAll()
        
        getPesananDataByDate(date: self.dateFormatter.string(from: date)) {
            print(self.dataTanggal)
            self.pesananTableView.reloadData()
        }
    }
    
    //for tableView
    func setupTableView() {
      
        pesananTableView.delegate = self
        pesananTableView.dataSource = self
        pesananTableView.rowHeight = 220
        pesananTableView.register(UINib(nibName: "CalendarViewCell", bundle: nil), forCellReuseIdentifier: "CalendarViewCell")
    }
}

extension OrderViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      print(dataTanggal.count)
      if dataTanggal.count == 0 {
        return 0
      }
        return dataTanggal.count
        
    }
    
    //to assign cell view from CalendarViewCell.xib
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarViewCell", for: indexPath) as! CalendarViewCell
        
        let data = dataTanggal[indexPath.item]
            
            cell.setupNama(nama: data.date )
            
            cell.setupMakanan(makanan: data.makanan )
            
            cell.setupStatus(status: data.status )
            
            cell.setupNomorRekening(nomorRekening: data.noRek )
            
            cell.setupPemilikBank(pemilikBank: data.pemilikBank )
            
            cell.setupBank(bank: data.bank )
            
            cell.setupTotal(total: data.total)
            
            cell.setupJumlah1(jumlah1: data.jumlah1)
            
            cell.setupDetail1(detail1: data.detail1)
            
            cell.setupJumlah2(jumlah2: data.jumlah2)
            
            cell.setupDetail2(detail2: data.detail2)
    
            cell.setupGambar(nama: data.date)
        
        return cell
    }
}
