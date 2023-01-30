//
//  TasksListViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

class TasksListTableViewController: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TaskTableViewCell: UITableViewCell {
    
}
