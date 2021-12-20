import Alamofire
import Foundation

let maxItems = 5
/*for repositoryFullName: String,
state: PullRequestState = .open,
sort: PullRequestSortMethod = .created,
direction: SortDirection = .ascending,
page: Int = 1,
itemsPerPage: Int = maxItemsPerPage,
onComplete: @escaping ([PullRequestModel]) -> Void
) {
let url = String(format: Self.baseUrl, repositoryFullName)

AF.request(
    url,
    parameters: [
        "state": state.queryParam,
        "sort": sort.queryParam,
        "direction": direction.queryParam,
        "per_page": itemsPerPage,
        "page": page
    ]*/

func pullService(
    state: String = "all",
    sort: String = "created",
    order: String = "ascending",
    page: Int,
    repoName: String,
    itemsPage: Int = 100,
    completion: @escaping ([PullModel]) -> Void
) {
    let baseUrlPull = "https://api.github.com/repos/\(repoName)/pulls"
    let decoder = JSONDecoder.init()
    decoder.dateDecodingStrategy = .iso8601
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    AF.request(
        baseUrlPull,
         parameters: [
        "state": state,
        "sort": sort,
        "direction": order,
        "per_page": itemsPage,
        "page": page
        ]
    ).responseDecodable(of: [PullModel].self, decoder: decoder) { response in

        guard let repos = response.value else { return }
        completion(repos)
    }
}
