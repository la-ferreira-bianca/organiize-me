//
//  CarrosselCollectionViewCell.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 26/01/23.
//

import UIKit

class CarrosselCollectionCell: UICollectionViewCell {
    //MARK: - Views
    lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.spacing = 10
        stack.contentMode = .scaleToFill
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.sizeToFit()
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.contentMode = .scaleToFill
        label.clipsToBounds = true
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    lazy var addIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus.viewfinder")!
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var carrosel: CarrosselModel! {
        didSet {
            self.updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = .yellow
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        if let carrosel = carrosel {
            titleLabel.text = carrosel.title
        } else {
            titleLabel.text = nil
        }
    }
    
    func setupViews() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(addIcon)
        stackView.addArrangedSubview(titleLabel)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
