//
//  TaskViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 02/03/23.
//

import Foundation
import UIKit

class TaskViewController: UIViewController {
    
    private var viewModel = TaskViewModel()
    private var taskID: String = ""
    
    lazy var taskTitile: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.textColor = .blue
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    init(taskID: String) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        self.taskID = taskID
        viewModel.fetchTask(with: taskID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupBinders()
    }
    
    func setupViews() {
        view.addSubview(taskTitile)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            taskTitile.heightAnchor.constraint(equalToConstant: 50),
            taskTitile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskTitile.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func setupBinders() {
        viewModel.task.bind { [weak self] taskTitle in
            self?.title = taskTitle
        }
    }
}
