//
//  CategoryListTableViewCell.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 06/03/23.
//

import UIKit

class CategoryListTableViewCell: UITableViewCell {
    
    var category: CategoryModel? {
        didSet {
            guard let taskItem = category else {return}
            titleLabel.text = taskItem.title
            descriptionLabel.text = taskItem.description
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor = .gray.withAlphaComponent(0.4)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            descriptionLabel
        ])
        stack.spacing = 10
        stack.axis = .vertical
        stack.contentMode = .scaleAspectFit
        stack.alignment = .leading
        
        stack.clipsToBounds = true
        stack.isLayoutMarginsRelativeArrangement = true
        stack.preservesSuperviewLayoutMargins = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        addSubview(stackView)
    }
}

