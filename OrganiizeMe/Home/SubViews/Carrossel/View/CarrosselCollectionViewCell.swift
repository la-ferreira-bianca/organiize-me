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
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var addIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus.viewfinder")!
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
        setupView()
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
    
    func setupView() {
        self.addSubview(titleLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(addIcon)
    }
}
