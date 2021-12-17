//
//  Pull.swift
//  DesafioModal2
//
//  Created by RICARDO AGNELO DE OLIVEIRA on 17/12/21.
//

import Foundation
struct  PullModel: Decodable, Identifiable {
    let id: Int
    let user: Owner
    let title: String
    let createdAt: String
    let body: String
}
