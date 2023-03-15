//
//  AddTaskViewController+Functions.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 06/03/23.
//

import UIKit

extension AddTaskViewController {
    //MARK: - objc Functions
    @objc func tapChooseMenuItem(_ sender: UIButton) {
        //TODO: REFACTOR, and get the id number for the selected category
        categoriesDropDown.dataSource = categoriesViewModel.categoriesTitles
        categoriesDropDown.anchorView = sender
        categoriesDropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        categoriesDropDown.show()
        categoriesDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let _ = self else { return }
            sender.setTitle(item, for: .normal) //9
        }
    }
    
    @objc func didTapButton(sender: UIButton) {
        guard let title = taskTitle.text, !title.isEmpty else {
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
        
        viewModel.addTask(with: title, taskDescription.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func initialCancelAction() {
        initalDateTextField.resignFirstResponder()
    }
    
    @objc
    func initialDoneAction() {
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
    
    //MARK: - Functions
    func setupViews() {
        view.addSubview(stackView)
        
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            taskTitle.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            
            taskDescription.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            taskDescription.heightAnchor.constraint(equalToConstant: 100),
            
            categoriesButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 60),
            categoriesButton.heightAnchor.constraint(equalToConstant: 40),
            
            initalDateTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            
            finalDateTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            
            addButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    
    
    func getStackViewStyle(for stack: UIStackView) -> UIStackView {
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        
        stack.spacing = 20
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 10)
        stack.layer.cornerRadius = 10
        
        stack.preservesSuperviewLayoutMargins = true
        stack.isLayoutMarginsRelativeArrangement = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layoutSubviews()
        return stack
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
    
    func getDateTextFieldStyle(for text: UITextField) -> UITextField {
        text.textColor = .black
        text.contentMode = .scaleAspectFit
        text.clipsToBounds = true
        text.font = UIFont.italicSystemFont(ofSize: 16)
        text.backgroundColor = .white
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        text.layer.cornerRadius = 10
        text.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        text.layer.shadowOpacity = 1
        text.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        text.layer.shadowRadius = 0.5
        text.layer.masksToBounds = false
        text.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        return text
    }
    
    
}
