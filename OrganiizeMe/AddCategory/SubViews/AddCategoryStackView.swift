//
//  AddCategoryStackView.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 07/02/23.
//

import UIKit

class AddCategoryStackView: UIStackView {
    //MARK: - Views
    lazy var categoryName: UITextField = {
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
    
    lazy var categoryDescription: UITextField = {
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
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Functions
    private func addSubviews() {
        self.addArrangedSubview(categoryName)
        self.addArrangedSubview(categoryDescription)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryDescription.heightAnchor.constraint(equalToConstant: 100),
            categoryDescription.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            
            categoryName.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
        ])
    }
}

