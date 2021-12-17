import Alamofire
import Foundation

var repoName = "shadowsocks/ShadowsocksX-NG"
let baseUrlPull = "https://api.github.com/repos/shadowsocks/ShadowsocksX-NG/pulls"

let maxItems = 5

func pullService(
    itemsPerPage: Int = 100,
    completion: @escaping ([PullModel]) -> Void
) {
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
