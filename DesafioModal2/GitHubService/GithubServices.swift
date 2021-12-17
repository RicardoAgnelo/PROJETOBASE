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
func GitService(
    search: String = "language:Swift",
    sortBy: String = "stars",
    order: String = "descending",
    page: Int = 1,
    itemsPerPage: Int = maxItemsPerPage,
    completion: @escaping (Repositories) -> Void
) {
    AF.request(
        baseUrl,
        parameters: [
            "q": search,
            "sort": sortBy,
            "order": order,
            "per_page": itemsPerPage,
            "page": page
        ]
    ).responseDecodable(of: Repositories.self) { response in
        debugPrint(response)
        guard let repos = response.value else { return }
        completion(repos)
    }
}
