//
//  CarrosselModel.swift
//  OrganiizeMe
//
//  Created by Bianca Ferreira on 26/01/23.
//

class CarrosselModel {
    //MARK: - Variables
    var title: String = ""
    
    init(title: String) {
        self.title = title
    }
    
    static func fetchCarrossel() -> [CarrosselModel] {
        return [
            CarrosselModel(title: "Tarefas"),
            CarrosselModel(title: "TurboList"),
            CarrosselModel(title: "Lembretes"),
            CarrosselModel(title: "Outros"),
        ]
    }
}

