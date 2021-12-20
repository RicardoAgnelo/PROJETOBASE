//
//  GithubServices.swift
//  DesafioModal2
//
//  Created by RICARDO AGNELO DE OLIVEIRA on 16/12/21.
//

import Alamofire
import Foundation

let baseUrl = "https://api.github.com/search/repositories"

let maxItemsPerPage = 100

func gitService(
    search: String = "language:Swift",
    sortBy: String = "stars",
    order: String = "descending",
    page: Int,
    itemsPerPage: Int = 100,
    completion: @escaping (Repositories) -> Void
) {
    let decoder = JSONDecoder.init()
    decoder.dateDecodingStrategy = .iso8601
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    AF.request(
        baseUrl,
        parameters: [
            "q": search,
            "sort": sortBy,
            "order": order,
            "per_page": itemsPerPage,
            "page": page
        ]
    ).responseDecodable(of: Repositories.self, decoder: decoder) { response in
        guard let repos = response.value else { return }
        completion(repos)
    }
}
