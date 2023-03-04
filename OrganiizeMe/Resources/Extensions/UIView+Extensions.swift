//
//  UIView+Extensions.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 04/03/23.
//

import UIKit

extension UIView {
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        self.endEditing(true)
    }
}
