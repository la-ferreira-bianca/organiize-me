//
//  TasksListViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit
import Alamofire

class TasksListTableViewController: UITableViewController {
    
    //MARK: - Variables
    var tasks: [Task] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.9490196078, blue: 0.9098039216, alpha: 1)
        title = "Minhas Tarefas"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle.fill"), style: .done, target: self, action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        setupViews()
        setupConstraints()
        fetchTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadInputViews()
    }
    
    //MARK: - Functions
    func setupViews() {
    }
    
    @objc func addTapped() {
        navigationController?.present(AddNewTaskViewController(), animated: true)
    }
    
    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Private Functions
    private func setupConstraints() {
    }
}

extension TasksListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.backgroundColor = .white
        cell.textLabel?.text = task.title
        cell.textLabel?.textColor = .black
        print(task.title)
        
        
        //        cell.textLabel?.text = userTasks?[indexPath.row] as? String
        return cell
    }
}

//TODO: CHANGE THIS METHOD TO THE VIEW MODEL AND THE CONTROLLER, AND PUT IN THE RIGHT FOLDERS REQUEST AND RESPONSE
extension TasksListTableViewController {
    func fetchTasks() {
        AF.request("http://34.30.232.59/tasks")
            .validate()
            .responseDecodable(of: Tasks.self) { (response) in
                guard let tasks = response.value else { return }
                self.tasks = tasks.allTasks
                self.tableView.reloadData()
            }
    }
}
