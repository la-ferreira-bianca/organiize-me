//
//  AddNewTaskViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 30/01/23.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    private var viewModel = AddTaskViewModel()
    
    //MARK: - Views
    var stackView = AddItemStackView(frame: .zero)
    
    lazy var titleImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "task-retangle"))
        imageView.frame = CGRect(x: -30, y: 0, width: 230, height: 70)
        return imageView
    }()
    
    lazy var viewTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        button.layer.shadowRadius = 0.5
        button.layer.masksToBounds = false
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.9490196078, blue: 0.9098039216, alpha: 1)
//        view.endEditing(true)
        setupViews()
        setupConstraints()
        view.initializeHideKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func didTapButton(sender: UIButton) {
        if let title = stackView.taskNameTextField.text, let description = stackView.taskDescriptionTextField.text {
            viewModel.addTask(with: title, description)
            self.navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(
                title: "Não foi possivel concluir",
                message: "Por favor, revise os campos e tente novamente",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .cancel
            ))
            self.present(alert, animated: true)
        }
    }
    
    //MARK: - Functions
    func setupViews() {
        //MARK: Setup StackView
        view.addSubview(titleImage)
        view.addSubview(viewTitleLabel)
        view.addSubview(stackView)
        view.addSubview(addButton)
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Private Functions
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            titleImage.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            viewTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
