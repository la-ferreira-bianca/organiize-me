//
//  CategoryViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController {
    
    private var viewModel = CategoryViewModel()
    private var categoryID: String = ""
    
    lazy var categoryTitle: UITextView = {
        let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.center = self.view.center
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor.blue
        textView.backgroundColor = UIColor.lightGray
        return textView
    }()
    
    init(categoryID: String) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        self.categoryID = categoryID
        viewModel.fetchCategories(with: categoryID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBinders()
    }
    
    func setupViews() {
        view.addSubview(categoryTitle)
    }
    
    private func setupBinders() {
        viewModel.category.bind { [weak self] categoryTitle in
            self?.title = categoryTitle
            self?.categoryTitle.text = categoryTitle
        }
    }
}
