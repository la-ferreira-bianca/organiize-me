//
//  PresentationStackView.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 26/01/23.
//

import UIKit

class PresentationStackView: UIStackView {
    
    //MARK: - Views
    lazy var profilePicture: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var alarmImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "bolt.square.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var pictureStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            alarmImage,
            profilePicture
        ])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        return stack
    }()
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "\("WelcomeUser".localized) Ester B."
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        self.alignment = .trailing
        self.distribution = .fill
        self.backgroundColor = .purple
        
        self.spacing = 3
        self.preservesSuperviewLayoutMargins = true
        self.layer.cornerRadius = Constants.Home.tenValue
        self.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 6, height: 5)
        self.layer.shadowRadius = 4
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20)
        
        self.layoutSubviews()
    }
    
    func setupConstraints() {
        self.addArrangedSubview(pictureStackView)
        self.addArrangedSubview(greetingLabel)
        
        //MARK: - Views
        NSLayoutConstraint.activate([
            profilePicture.heightAnchor.constraint(equalToConstant: 50),
            profilePicture.widthAnchor.constraint(equalToConstant: 50),
            alarmImage.heightAnchor.constraint(equalToConstant: 30),
            alarmImage.widthAnchor.constraint(equalToConstant: 30),
            
        ])
        
        NSLayoutConstraint.activate([
            pictureStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pictureStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

