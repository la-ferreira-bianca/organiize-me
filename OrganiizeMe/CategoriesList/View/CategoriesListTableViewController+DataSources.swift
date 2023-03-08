//
//  CategoriesListTableViewController+DataSources.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 06/03/23.
//

import UIKit

extension CategoriesListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CategoryListTableViewCell else { return UITableViewCell() }
        let category = categories[indexPath.row]
        cell.category = category
        cell.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        navigationController?.pushViewController(CategoryViewController(categoryID: category.id), animated: true)
    }
}
