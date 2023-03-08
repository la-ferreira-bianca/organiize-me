//
//  TaskListTableViewController+DataSources.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 06/03/23.
//

import UIKit

extension TasksListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TaskListTableViewCell else { return UITableViewCell() }
        let task = tasks[indexPath.row]
        cell.task = task
        cell.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        navigationController?.pushViewController(TaskViewController(taskID: task.id), animated: true)
    }
}
