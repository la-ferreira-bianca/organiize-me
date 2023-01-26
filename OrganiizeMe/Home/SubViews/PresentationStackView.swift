//
//  PresentationStackView.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 26/01/23.
//

import UIKit

class PresentationStackView: UIStackView {
    
    //MARK: - Views
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem Vindo(a): "
        label.textColor = .white
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ester B."
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        self.axis = .vertical
        self.spacing = Constants.Home.tenValue
        self.alignment = .leading
        self.distribution = .fillProportionally
        self.backgroundColor = .purple
        self.layer.cornerRadius = Constants.Home.tenValue
    }
    
    func setupConstraints() {
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(nameLabel)
        
        //MARK: - SubViews
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.Home.tenValue),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.Home.tenValue),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.Home.tenValue),
        ])
    }
}

