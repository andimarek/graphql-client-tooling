import UIKit
import Apollo

class PostListViewController: UITableViewController {
  var books: [AllBooksQuery.Data.Book?]? {
    didSet {
      tableView.reloadData()
    }
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 64
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    loadData()
  }
  
  // MARK: - Data loading
  
  var watcher: GraphQLQueryWatcher<AllBooksQuery>?
  
  func loadData() {
    watcher = apollo.watch(query: AllBooksQuery()) { result in
      switch result {
      case .success(let graphQLResult):
        self.books = graphQLResult.data?.books
      case .failure(let error):
        NSLog("Error while fetching query: \(error.localizedDescription)")
      }
    }
  }
  
  // MARK: - UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return books?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PostTableViewCell else {
      fatalError("Could not dequeue PostTableViewCell")
    }
    
    guard let book = books?[indexPath.row] else {
      fatalError("Could not find book at row \(indexPath.row)")
    }
    
    cell.configure(with: book.fragments.bookDetails)
    
    return cell
  }
}
