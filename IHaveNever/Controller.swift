//
//  Controller.swift
//  IHaveNever
//
//  Created by PEPPA CHAN on 02.12.2024.
//

import Foundation

final class GameInfo: ObservableObject {
    static let shared = GameInfo()
    
    @Published var gameData: [AppCard] = []
    @Published var selectedIndex: [Int] = []
    @Published var categoryName: [String] = []
    @Published var categoryNameEn: [String] = []
    @Published var isGameStarted: Bool = false
    
    func addData(_ data: [AppCard], name: String, nameEn: String) {
        data.forEach { item in
            gameData.append(item)
            categoryName.append(name)
            categoryNameEn.append(nameEn)
        }
    }
    
    func removeData(_ data: [AppCard], name: String, nameEn: String) {
        data.forEach { item in
            gameData.removeAll(where: { $0.appCardIdValue == item.appCardIdValue })
            categoryName.removeAll(where: { $0 == name })
            categoryName.removeAll(where: { $0 == nameEn })
        }
    }
}
