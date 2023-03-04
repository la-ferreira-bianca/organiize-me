//
//  TasksListViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit
class TasksListTableViewController: UITableViewController {
    
    //MARK: - Variables
    private var viewModel = TasksViewModel()
    var tasks = [TaskModel]()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.fetchTasks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.9490196078, blue: 0.9098039216, alpha: 1)
        title = "Minhas Tarefas"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle.fill"), style: .done, target: self, action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        setupBinders()
    }
    
    //MARK: - Functions
    @objc func addTapped() {
        navigationController?.pushViewController(AddNewTaskViewController(), animated: true)
    }
    
    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Binding
    private func setupBinders() {
        viewModel.tasks.bind { [weak self] value in
            guard let task = value else { return }
            self?.tasks = task
            self?.tableView.reloadData()
        }
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
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        navigationController?.pushViewController(TaskViewController(taskID: task.id), animated: true)
    }
}
