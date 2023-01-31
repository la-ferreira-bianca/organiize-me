//
//  AddTaskStackView.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 31/01/23.
//

import UIKit

class AddTaskStackView: UIStackView {
    
    //MARK: - Views
    lazy var taskNameTextField: UITextField = {
        let textField = FloatingTextField(frame: .zero)
        textField.placeholder = "TaskNamePlaceholder".localized
        textField.textColor = .black
        textField.contentMode = .scaleToFill
        textField.clipsToBounds = true
        textField.font = UIFont.italicSystemFont(ofSize: 16)
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var taskDescriptionTextField: UITextField = {
        let textField = FloatingTextField(frame: .zero)
        textField.placeholder = "Descrição"
        textField.textColor = .black
        textField.contentMode = .scaleToFill
        textField.clipsToBounds = true
        textField.font = UIFont.italicSystemFont(ofSize: 16)
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var taskIntialDate: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = .white
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
    
    //MARK: - Functions
    func setupStackView() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fillProportionally
        self.backgroundColor = .purple
        self.preservesSuperviewLayoutMargins = true
        self.layer.cornerRadius = 10
        self.spacing = 10
        self.layoutSubviews()
    }
    
    func setupConstraints() {
        self.addArrangedSubview(taskNameTextField)
        self.addArrangedSubview(taskDescriptionTextField)
        self.addArrangedSubview(taskIntialDate)
    }
}
