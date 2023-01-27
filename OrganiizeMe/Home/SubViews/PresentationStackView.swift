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
        label.text = "WelcomeUser".localized
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ester B."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
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
        self.alignment = .leading
        self.distribution = .fillProportionally
        self.backgroundColor = .purple
        self.preservesSuperviewLayoutMargins = true
        self.layer.cornerRadius = Constants.Home.tenValue
        self.layoutSubviews()
    }
    
    func setupConstraints() {
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(nameLabel)
    }
}

