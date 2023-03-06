//
//  AddCategoryViewController+Functions.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 07/03/23.
//

import UIKit

extension AddCategoryViewController {
    
    //MARK: - Functions
    @objc func didTapButton(sender: UIButton) {
        guard let title = categoryName.text, !title.isEmpty else {
            let alert = UIAlertController(
                title: "Não foi possivel concluir",
                message: "Por favor, revise os campos e tente novamente",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .cancel
            ))
            return self.present(alert, animated: true)
        }
        
        viewModel.addCategory(with: title, and: categoryDescription.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        //MARK: Setup StackView
        view.addSubview(stackView)
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            categoryName.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            
            categoryDescription.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            
            addButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func getStackViewStyle(for stackView: UIStackView) -> UIStackView {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        stackView.layer.cornerRadius = 10
        stackView.spacing = 20
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 10)
        
        stackView.preservesSuperviewLayoutMargins = true
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutSubviews()
        return stackView
    }
    
    func getTextStyle(for text: UITextField) -> UITextField {
        text.textColor = .white
        text.contentMode = .scaleAspectFit
        text.clipsToBounds = true
        text.font = UIFont.italicSystemFont(ofSize: 16)
        text.backgroundColor = .white.withAlphaComponent(0.3)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }
    
    func getButtonStyle(for button: UIButton) -> UIButton {
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        button.layer.shadowRadius = 0.5
        button.layer.masksToBounds = false
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
