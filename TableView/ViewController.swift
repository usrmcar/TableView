//
//  ViewController.swift
//  TableView
//
//  Created by Samir Carvalho on 10/07/2018.
//  Copyright © 2018 KDEA Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "Test GitHub"
        cell.detailTextLabel?.text = "www.kdeasolutions.com"


        return cell
    }
}
