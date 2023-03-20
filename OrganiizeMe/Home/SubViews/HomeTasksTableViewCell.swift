//
//  HomeTasksTableViewCell.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 20/03/23.
//

import UIKit

class HomeTasksTableViewCell: UITableViewCell {
    
    var task: TaskModel? {
        didSet {
            guard let taskItem = task else {return}
            titleLabel.text = taskItem.title
        }
    }
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "list.bullet.circle.fill")
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            iconImage,
            titleLabel
        ])
        stack.spacing = 10
        stack.axis = .horizontal
        stack.contentMode = .scaleToFill
        stack.distribution = .fillProportionally

        stack.alignment = .center
        stack.backgroundColor = .blue
        stack.layer.cornerRadius = 10
        
        stack.clipsToBounds = true
        stack.isLayoutMarginsRelativeArrangement = true
        stack.preservesSuperviewLayoutMargins = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layoutSubviews()
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        backgroundColor = .clear
        contentView.layer.cornerRadius = 10
        addSubview(stackView)
    }
    
    func setupConstraints() {
        //TODO: reedo width because is breaking
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 60),
//
//            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
//            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
    
}

