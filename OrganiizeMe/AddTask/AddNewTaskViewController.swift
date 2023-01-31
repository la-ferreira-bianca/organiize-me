//
//  AddNewTaskViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 30/01/23.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    //MARK: - Views
    lazy var taskNameTextField: FloatingTextField = {
        let textField = FloatingTextField(frame: .zero)
        textField.placeholder = "TaskNamePlaceholder".localized
        textField.textColor = .black
        textField.contentMode = .scaleToFill
        textField.clipsToBounds = true
        textField.font = UIFont.italicSystemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(taskNameTextField)
        NSLayoutConstraint.activate([
            taskNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            taskNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            taskNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
}
