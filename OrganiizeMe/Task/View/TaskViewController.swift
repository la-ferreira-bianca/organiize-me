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
    
    lazy var taskTitle: UITextView = {
        let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.center = self.view.center
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor.blue
        textView.backgroundColor = UIColor.lightGray
        return textView
    }()
    
    init(taskID: String) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
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
        view.addSubview(taskTitle)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            taskTitle.heightAnchor.constraint(equalToConstant: 50),
            taskTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            taskTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func setupBinders() {
        viewModel.task.bind { [weak self] taskTitle in
            self?.title = taskTitle
            self?.taskTitle.text = taskTitle
        }
    }
}
