//
//  FloatingTextField.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 31/01/23.
//

import UIKit

class FloatingTextField: UITextField {
    //MARK: - Variables
    var floatingLabel: UILabel!
    let floatingLabelHeight: CGFloat = 14.0
    
    //MARK: - @IBInspectable
    @IBInspectable
    var _placeHolder: String?
    
    @IBInspectable
    var _backgroundColor: UIColor = UIColor.white {
        didSet {
            self.layer.backgroundColor = self._backgroundColor.cgColor
        }
    }
    
    @IBInspectable
    var floatingLabelColor: UIColor = .black {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var activeBorderColor: UIColor = .blue
    
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    var floatingLabelBackground: UIColor = UIColor.white.withAlphaComponent(1) {
        didSet {
            self.floatingLabel.backgroundColor = self.floatingLabelBackground
            self.setNeedsDisplay()
        }
    }
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self._placeHolder = (self._placeHolder != nil) ? self._placeHolder : placeholder
        placeholder = self._placeHolder
        self.floatingLabel = UILabel(frame: .zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - OBJC Functions
    @objc func addFloatingLabel() {
        if self.text == "" {
            self.addSubview(floatingLabel)
            floatingLabel.textColor = floatingLabelColor
            floatingLabel.font = floatingLabelFont
            floatingLabel.text = self._placeHolder
            floatingLabel.layer.backgroundColor = UIColor.white.cgColor
            floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            floatingLabel.clipsToBounds = true
            floatingLabel.frame = CGRect(x: 0, y: 0, width: floatingLabel.frame.width+4, height: floatingLabel.frame.height+2)
            floatingLabel.textAlignment = .center
            floatingLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -10).isActive = true
            
            self.layer.borderColor = activeBorderColor.cgColor
            self.placeholder = ""
        }
        self.bringSubviewToFront(subviews.last!)
        self.setNeedsDisplay()
    }
    
    @objc func removeFloatingLabel() {
        if self.text == "" {
            UIView.animate(withDuration: 0.13) {
                self.subviews.forEach{ $0.removeFromSuperview() }
                self.setNeedsDisplay()
            }
            self.placeholder = self._placeHolder
        }
        self.layer.borderColor = UIColor.black.cgColor
    }
    
}
