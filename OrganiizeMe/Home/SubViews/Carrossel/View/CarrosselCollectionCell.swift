//
//  CarrosselCollectionCell.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 26/01/23.
//

import UIKit

class CarrosselCollectionCell: UICollectionViewCell {
    //MARK: - Views
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.contentMode = .scaleToFill
        label.clipsToBounds = true
        label.font = UIFont.preferredFont(forTextStyle: .title2)
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
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            addIcon,
            titleLabel
        ])
        stack.spacing = 10
        stack.contentMode = .scaleToFill
        stack.clipsToBounds = true
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    var carrosel: CarrosselModel! {
        didSet {
            self.updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.7152295709, green: 0.8760627508, blue: 0.8506777883, alpha: 1)
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
    
    //MARK: - Private Functions
    private func setupViews() {
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
