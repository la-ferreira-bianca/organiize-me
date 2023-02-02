//
//  AddItemStackView.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 31/01/23.
//

import UIKit
import DropDown

class AddItemStackView: UIStackView {
    let categoriesDropDown = DropDown()
    
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
    
    private func setupConstraints() {
        self.addArrangedSubview(taskNameTextField)
        self.addArrangedSubview(taskDescriptionTextField)
        self.addArrangedSubview(categoriesButton)
        self.addArrangedSubview(taskIntialDate)
        self.addArrangedSubview(taskFinalDate)
        
        NSLayoutConstraint.activate([
            taskDescriptionTextField.heightAnchor.constraint(equalToConstant: 100),
            categoriesButton.heightAnchor.constraint(equalToConstant: 40),
            categoriesButton.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            taskNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            taskDescriptionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
}
