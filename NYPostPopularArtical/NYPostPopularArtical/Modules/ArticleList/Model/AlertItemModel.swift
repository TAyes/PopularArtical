//
//  AlertItemModel.swift
//  NYPostPopularArtical
//
//  Created by Syed Syeda on 28/04/2023.
//

import Foundation
struct AlertItem: Identifiable {
    var id = UUID()
    var message: String
    var title: String?
}
