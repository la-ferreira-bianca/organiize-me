//
//  CategoryViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

final class CategoryViewModel {
    private let repository: CategoryModelRepository = CategoryModelRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev)
    
    var error: ObservableObject<String?> = ObservableObject(value: nil)
    var category: ObservableObject<String?> = ObservableObject(value: nil)
    
    func fetchCategories(with id: String) {
        repository.getCategory(with: id) { [unowned self] result in
            switch result {
            case .success(let categoryData):
                self.category.value = categoryData.title
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
}
