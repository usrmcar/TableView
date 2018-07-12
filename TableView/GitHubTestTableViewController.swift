//
//  GitHubTestTableViewController.swift
//  TableView
//
//  Created by Samir Carvalho on 11/07/2018.
//  Copyright © 2018 KDEA Solutions. All rights reserved.
//

import UIKit

class GitHubTestTableViewController: UITableViewController {
    
    var gits = [GitHubExample]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.extractDataFrom(json: "gitHub", andExtension: "json")
        self.tableView.register(GitHubTableViewCell.self, forCellReuseIdentifier: GitHubTableViewCell.cellId)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GitHubTableViewCell.cellId, for: indexPath) as! GitHubTableViewCell
        let gitHub = gits[indexPath.row]
        cell.gitHub = gitHub
        return cell
    }
    
    func extractDataFrom(json: String, andExtension: String) {
        guard let path = Bundle.main.path(forResource: json, ofType: andExtension) else { return }
        let url = URL(fileURLWithPath: path)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    self.gits = try JSONDecoder().decode([GitHubExample].self, from: data)
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
