//
//  AddNewTaskViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 30/01/23.
//

import UIKit
import DropDown

class AddTaskViewController: UIViewController {
    
    var viewModel = AddTaskViewModel()
    
    //MARK: - Views
    let categoriesDropDown = DropDown()
    
    lazy var viewTitle: UILabel = {
        let text = UILabel(frame: .zero)
        text.text = "Adicionar nova Tarefa"
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        return text
    }()
    
    lazy var taskTitle: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "TaskNamePlaceholder".localized
        return getTextStyle(for: textField)
    }()
    
    lazy var taskDescription: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Descrição"
        return getTextStyle(for: textField)
    }()
    
    lazy var categoriesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Categorias", for: .normal)
        button.addTarget(self, action: #selector(tapChooseMenuItem), for: .touchUpInside)
        return getButtonStyle(for: button)
    }()
    
    lazy var initalDateTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(string: "Data Inicio", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.datePicker(
            target: self,
            doneAction: #selector(initialDoneAction),
            cancelAction: #selector(initialCancelAction),
            datePickerMode: .date
        )
        return getDateTextFieldStyle(for: textField)
    }()
    
    lazy var finalDateTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(string: "Data Limite", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.datePicker(
            target: self,
            doneAction: #selector(finalDoneAction),
            cancelAction: #selector(finalCancelAction),
            datePickerMode: .date
        )
       return getDateTextFieldStyle(for: textField)
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return getButtonStyle(for: button)
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            viewTitle,
            taskTitle,
            taskDescription,
            categoriesButton,
            initalDateTextField,
            finalDateTextField,
            addButton
        ])
        return getStackViewStyle(for: stack)
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
