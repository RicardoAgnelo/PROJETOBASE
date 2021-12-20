import Foundation
class PullFeed: ObservableObject {
    @Published var pulls = [PullModel]()
    @Published var isLoadingPage = false
    var repoName: String
    private var currentPage = 0
    private var canLoadMorePages = true

    init(repoName: String) {
        self.repoName = repoName
    }
    func loadingMorePulls () {
        loadMoreContent()
    }
    func loadMoreContentIfNeeded(currentItem item: PullModel) {

        let thresholdIndex = pulls.index(pulls.endIndex, offsetBy: -5)
        if pulls.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            loadMoreContent()
        }
    }

    private func loadMoreContent() {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }
        currentPage += 1

        isLoadingPage = true
        pullService(page: currentPage, repoName: self.repoName) { [weak self](respon)
            in self?.pulls.append(contentsOf: respon)
            self?.isLoadingPage = false}
        print(currentPage)
    }
}
