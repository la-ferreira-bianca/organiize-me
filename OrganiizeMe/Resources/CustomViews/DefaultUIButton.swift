//
//  DefaultUIButton.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 06/03/23.
//

import UIKit

class DefaultUIButton: UIButton {
    lazy var defaultButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.1529411765, green: 0.3490196078, blue: 0.3137254902, alpha: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 1.5, height: 4)
        button.layer.shadowRadius = 0.5
        button.layer.masksToBounds = false
        button.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.7490196078, blue: 0.7019607843, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
}
