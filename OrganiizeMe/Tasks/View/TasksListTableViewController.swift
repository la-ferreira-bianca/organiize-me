//
//  TasksListViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 24/01/23.
//

import UIKit

//TODO: - MAKE THIS FUNCTIONS GLOBAL
fileprivate func makeRepository() -> TasksModelRepository {
    TasksModelRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev)
}

fileprivate func makeViewModel(
    repository: TasksModelRepository,
    onSuccess: @escaping (_ factValue: [TaskModel]) -> Void,
    onError: @escaping (_ errorMessage: String) -> Void
) -> TasksViewModel {
    TasksViewModel(repository: repository, onSuccess: onSuccess, onError: onError)
}

class TasksListTableViewController: UITableViewController {
    
    //MARK: - Variables
    private var viewModel: TasksViewModel!
    var tasks = [TaskModel]()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.9490196078, blue: 0.9098039216, alpha: 1)
        title = "Minhas Tarefas"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle.fill"), style: .done, target: self, action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        setupViews()
        setupConstraints()
        self.viewModel = makeViewModel(repository: makeRepository(),
                                       onSuccess: { [weak self] in self?.onSuccess(data: $0) },
                                       onError: { [weak self] in self?.onError(errorMessage: $0) })
        viewModel.fetchTasks()
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
    
    // MARK: - Binding
    func onSuccess(data: [TaskModel]) {
        self.tasks = data
        tableView.reloadData()
    }
    
    func onError(errorMessage: String) {
        print(Self.self, #function, errorMessage)
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
