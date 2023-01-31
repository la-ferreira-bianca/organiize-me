//
//  AddNewTaskViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 30/01/23.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    //MARK: - Views
    var stackView = AddTaskStackView(frame: .zero)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
