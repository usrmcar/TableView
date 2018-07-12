//
//  GitHubTableViewCell.swift
//  TableView
//
//  Created by Samir Carvalho on 11/07/2018.
//  Copyright © 2018 KDEA Solutions. All rights reserved.
//

import UIKit

class GitHubTableViewCell: UITableViewCell {
    
    var gitHub: GitHubExample? {
        didSet {
            guard let unwrappedGit = gitHub else { return }
            self.textLabel?.text = unwrappedGit.title
            self.detailTextLabel?.text = unwrappedGit.status
        }
    }
    
    static let cellId = "gitHubCell"
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: GitHubTableViewCell.cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
