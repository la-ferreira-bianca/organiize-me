//
//  CategoriesListTableViewController.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 07/02/23.
//

import UIKit

class CategoriesListTableViewController: UITableViewController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.9490196078, blue: 0.9098039216, alpha: 1)
        title = "Minhas Categorias"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.circle.fill"), style: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(cancelTapped))

        setupViews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: - Functions
    func setupViews() {
    }
    
    @objc func cancelTapped() {
        navigationController?.present(AddNewCategoryViewController(), animated: true)
    }
    
    @objc func addTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Private Functions
    private func setupConstraints() {
    }
}

extension CategoriesListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}


//#if DEBUG
//import SwiftUI
//
//struct CategoriesListTableViewControllerRepresentable: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> some UIViewController {
//        return CategoriesListTableViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
//}
//
//struct CategoriesListTableViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        CategoriesListTableViewControllerRepresentable()
//            .previewDevice("iPhone SE (3rd generation)")
//    }
//}
//#endif
