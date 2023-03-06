//
//  CategoriesViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

class CategoriesViewModel {
    private let repository: CategoriesModelRepository = CategoriesModelRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev)
    var error: ObservableObject<String?> = ObservableObject(value: nil)
    var categories: ObservableObject<[CategoryModel]?> = ObservableObject(value: nil)
    
    func fetchCategories() {
        repository.getCategories { [unowned self] result in
            switch result {
            case .success(let categoriesData):
                self.categories.value = categoriesData.allCategories
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
    
}
