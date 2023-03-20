//
//  HomeViewController+DataSources.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 20/03/23.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HomeTasksTableViewCell else {
            return UITableViewCell()
        }
        let task = tasks[indexPath.row]
        cell.task = task
        cell.selectionStyle = .none
        return cell
    }
}

