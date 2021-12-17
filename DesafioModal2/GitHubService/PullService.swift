import Alamofire
import Foundation

let maxItems = 5

func pullService(
    repoName: String,
    itemsPerPage: Int = 100,
    completion: @escaping ([PullModel]) -> Void
) {
    let baseUrlPull = "https://api.github.com/repos/\(repoName)/pulls"
    let decoder = JSONDecoder.init()
    decoder.dateDecodingStrategy = .iso8601
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    AF.request(
        baseUrlPull
    ).responseDecodable(of: [PullModel].self, decoder: decoder) { response in

        guard let repos = response.value else { return }
        print(response)
        completion(repos)
    }
}
