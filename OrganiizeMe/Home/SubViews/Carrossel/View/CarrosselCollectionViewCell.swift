//
//  CarrosselCollectionViewCell.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 26/01/23.
//

import UIKit

class CarrosselCollectionCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var addIcon: UIImage = {
        let image: UIImage = UIImage(systemName: "plus.viewfinder")!
        return image
    }()
    
    var carrosel: CarrosselModel! {
        didSet {
            self.updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
}
