//
//  AddCategoryStackView.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 07/02/23.
//

import UIKit

class AddCategoryStackView: UIStackView {
    //MARK: - Views
    lazy var taskNameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Nome da Categoria"
        textField.textColor = .black
        textField.contentMode = .scaleAspectFit
        textField.clipsToBounds = true
        textField.font = UIFont.italicSystemFont(ofSize: 16)
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var taskDescriptionTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Descrição"
        textField.textColor = .black
        textField.contentMode = .scaleAspectFit
        textField.clipsToBounds = true
        textField.font = UIFont.italicSystemFont(ofSize: 16)
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupStackView()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Ojbc Functions
    
    //MARK: - Private Functions
    private func setupStackView() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fill
        self.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1).withAlphaComponent(0.3)
        self.preservesSuperviewLayoutMargins = true
        self.layer.cornerRadius = 10
        self.spacing = 20
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 10)
        self.layoutSubviews()
    }
    
    private func addSubviews() {
        self.addArrangedSubview(taskNameTextField)
        self.addArrangedSubview(taskDescriptionTextField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            taskDescriptionTextField.heightAnchor.constraint(equalToConstant: 100),
            taskDescriptionTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            
            taskNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
        ])
    }
}

