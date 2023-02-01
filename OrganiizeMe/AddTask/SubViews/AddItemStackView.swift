//
//  AddItemStackView.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 31/01/23.
//

import UIKit

class AddItemStackView: UIStackView {
    
    //MARK: - Views
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
    
    //TODO: Put the date picker with label
    lazy var taskIntialDate: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .date
        
        return datePicker
    }()
    
    lazy var taskFinalDate: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Functions
    private func setupStackView() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fill
        self.backgroundColor = .clear
        self.preservesSuperviewLayoutMargins = true
        self.layer.cornerRadius = 10
        self.spacing = 20
        self.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1).withAlphaComponent(0.1)
        self.layoutSubviews()
    }
    
    private func setupConstraints() {
        self.addArrangedSubview(taskNameTextField)
        self.addArrangedSubview(taskDescriptionTextField)
        self.addArrangedSubview(taskIntialDate)
        self.addArrangedSubview(taskFinalDate)
        
        NSLayoutConstraint.activate([
            taskDescriptionTextField.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            taskNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            taskDescriptionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
}
