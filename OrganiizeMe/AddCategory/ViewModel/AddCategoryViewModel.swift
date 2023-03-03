//
//  AddCategoryViewModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 03/03/23.
//

import Foundation

final class AddCategoryViewModel {
    private let repository: CategoryModelRepository = CategoryModelRemoteRepository(httpClient: URLSessionHTTPClient(), api: .dev)
    
    var error: ObservableObject<String?> = ObservableObject(value: nil)
    var category: ObservableObject<CategoryModel?> = ObservableObject(value: nil)
    
    func addCategory(with title: String, and description: String) {
        repository.postCategory(with: title, and: description) { [unowned self] result in
            switch result {
            case .success(let categoryData):
                self.category.value = categoryData
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
    
}
