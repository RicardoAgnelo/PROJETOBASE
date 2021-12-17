import Foundation
class RepositoriesFeed : ObservableObject{
    @Published var items = [item]()
    @Published var isLoadingPage = false
    private var currentPage = 1
    private var canLoadMorePages = true
    
    init() {
        loadMoreContent()
    }
    
    func loadMoreContentIfNeeded(currentItem item: item) {

        let thresholdIndex = items.index(items.endIndex, offsetBy: -30)
        if items.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            loadMoreContent()
        }
    }
    
    private func loadMoreContent() {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }
        
        isLoadingPage = true
        currentPage += 1
        GitService(page: currentPage) { [weak self](repos)
            in self?.items.append(contentsOf: repos.items) ;
            self?.isLoadingPage = false}
    }
}


