import UIKit
import Apollo

class PostTableViewCell: UITableViewCell {
  var bookId: String?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  
  func configure(with book: BookDetails) {
    bookId = book.id
    
    titleLabel?.text = book.title
    authorLabel?.text = book.author
//    votesLabel?.text = "\(post.votes ?? 0) vote\(post.votes == 1 ? "" : "s")"
  }
  
  @IBAction func changeTitle() {
    
    guard let bookId = bookId else { return }
    let input = UpdateBookTitleInput(id:bookId,title: "newTitle")
    apollo.perform(mutation: UpdateBookTitleMutation(input: input)) { result in
      switch result {
      case .success:
        break
      case .failure(let error):
        NSLog("Error while attempting to upvote post: \(error.localizedDescription)")
      }
    }
  }


// We can define helper methods that take the generated data types as arguments

//func byline(for post: PostDetails) -> String? {
//  if let author = post.author {
//    return "by \(author.fullName)"
//  } else {
//    return nil
//  }
//}

// We can also extend the generated data types to add convenience properties and methods

//extension PostDetails.Author {
//  var fullName: String {
//    return [firstName, lastName].compactMap { $0 }.joined(separator: " ")
//  }
}
