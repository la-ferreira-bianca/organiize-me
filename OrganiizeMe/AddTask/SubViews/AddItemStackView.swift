//
//  AddItemStackView.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 31/01/23.
//

import UIKit
import DropDown

class AddItemStackView: UIStackView {
    //MARK: - Views
    let categoriesDropDown = DropDown()
    
    lazy var taskNameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "TaskNamePlaceholder".localized
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
    
    lazy var categoriesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Categorias", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        button.layer.shadowRadius = 0.5
        button.layer.masksToBounds = false
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        button.addTarget(self, action: #selector(tapChooseMenuItem), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var initalDateTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(string: "Data Inicio", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textColor = .white
        textField.textAlignment = .center
        textField.contentMode = .scaleAspectFit
        textField.clipsToBounds = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        textField.layer.shadowOpacity = 1
        textField.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        textField.layer.shadowRadius = 0.5
        textField.layer.masksToBounds = false
        textField.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        textField.datePicker(
            target: self,
            doneAction: #selector(doneAction),
            cancelAction: #selector(cancelAction),
            datePickerMode: .date
        )
        
        return textField
    }()
    
    lazy var finalDateTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(string: "Data Limite", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.contentMode = .scaleAspectFit
        textField.clipsToBounds = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        textField.layer.shadowOpacity = 1
        textField.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        textField.layer.shadowRadius = 0.5
        textField.layer.masksToBounds = false
        textField.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        textField.datePicker(
            target: self,
            doneAction: #selector(finalDoneAction),
            cancelAction: #selector(finalCancelAction),
            datePickerMode: .date
        )
        
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
    @objc func tapChooseMenuItem(_ sender: UIButton) {
        //TODO: Pass categories that will be populated by the user
        //TODO: Change layout
        categoriesDropDown.dataSource = ["Tomato soup", "Mini burgers", "Onion rings", "Baked potato", "Salad"]
        categoriesDropDown.anchorView = sender
        categoriesDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        categoriesDropDown.show()
        categoriesDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
        }
    }
    
    @objc
    func cancelAction() {
        initalDateTextField.resignFirstResponder()
    }
    
    @objc
    func doneAction() {
        if let datePickerView = initalDateTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: datePickerView.date)
            initalDateTextField.text = dateString
            
            initalDateTextField.resignFirstResponder()
        }
    }
    
    @objc
    func finalCancelAction() {
        finalDateTextField.resignFirstResponder()
    }
    
    @objc
    func finalDoneAction() {
        if let datePickerView = finalDateTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: datePickerView.date)
            finalDateTextField.text = dateString
            
            finalDateTextField.resignFirstResponder()
        }
    }
    
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
        self.addArrangedSubview(categoriesButton)
        self.addArrangedSubview(initalDateTextField)
        self.addArrangedSubview(finalDateTextField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            taskDescriptionTextField.heightAnchor.constraint(equalToConstant: 100),
            taskDescriptionTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            
            taskNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            
            categoriesButton.heightAnchor.constraint(equalToConstant: 40),
            categoriesButton.widthAnchor.constraint(equalToConstant: 200),
            
            initalDateTextField.widthAnchor.constraint(equalToConstant: 200),
            initalDateTextField.heightAnchor.constraint(equalToConstant: 40),
            
            finalDateTextField.widthAnchor.constraint(equalToConstant: 200),
            finalDateTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
