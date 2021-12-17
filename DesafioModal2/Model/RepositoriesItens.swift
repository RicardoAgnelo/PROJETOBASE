//
//  RepositoriesItens.swift
//  DesafioModal2
//
//  Created by RICARDO AGNELO DE OLIVEIRA on 16/12/21.
//

import Foundation

struct Item: Decodable, Identifiable {
    let owner: Owner
    let id: Int
    let name: String
    let fullName: String
    let watchersCount: Int
    let forksCount: Int
    let description: String?
}
