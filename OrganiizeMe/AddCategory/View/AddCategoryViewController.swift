//
//  AddNewCategoryViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 07/02/23.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    //MARK: - Variables
    var viewModel = AddCategoryViewModel()

    //MARK: - Views
    lazy var viewTitle: UILabel = {
        let text = UILabel(frame: .zero)
        text.text = "Adicionar nova Categoria"
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        return text
    }()
    
    lazy var categoryName: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Nome da Categoria"
        return getTextStyle(for: textField)
    }()
    
    lazy var categoryDescription: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Descrição"
        
        return getTextStyle(for: textField)
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            viewTitle,
            categoryName,
            categoryDescription,
            addButton
        ])
        
        return getStackViewStyle(for: stackView)
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return getButtonStyle(for: button)
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.initializeHideKeyboard()
        
        setupViews()
        setupConstraints()
    }
}
