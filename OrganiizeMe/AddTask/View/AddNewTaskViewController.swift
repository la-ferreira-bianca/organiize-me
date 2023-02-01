//
//  AddNewTaskViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 30/01/23.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    //MARK: - Views
    var stackView = AddItemStackView(frame: .zero)
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        button.layer.shadowRadius = 0.5
        button.layer.masksToBounds = false
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.9490196078, blue: 0.9098039216, alpha: 1)
        title = "Adicionar Tarefa"
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Functions
    func setupViews() {
        //MARK: Setup StackView
        view.addSubview(stackView)
        view.addSubview(addButton)
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Private Functions
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//            stackView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

#if DEBUG
import SwiftUI

struct AddNewTaskViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return AddNewTaskViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct AddNewTaskViewController_Preview: PreviewProvider {
    static var previews: some View {
        AddNewTaskViewControllerRepresentable()
            .previewDevice("iPhone SE (3rd generation)")
    }
}

#endif
