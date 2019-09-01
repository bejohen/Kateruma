//
//  TableViewController.swift
//  cek
//
//  Created by Christian Widjaja on 29/08/19.
//  Copyright © 2019 Christian Widjaja. All rights reserved.
//

import UIKit

class OrderListTableViewController: UITableViewController {

    var rowCount = 2
    
    @IBOutlet weak var button: UIButton!
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("be")
        rowCount = rowCount - 1
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }


}
