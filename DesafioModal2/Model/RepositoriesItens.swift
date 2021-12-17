//
//  RepositoriesItens.swift
//  DesafioModal2
//
//  Created by RICARDO AGNELO DE OLIVEIRA on 16/12/21.
//

import Foundation

struct item: Decodable,Identifiable {
    let owner: owner
    let id : Int
    let name: String
    let full_name: String
    let watchers_count: Int
    let forks_count: Int
    let description: String?
}
