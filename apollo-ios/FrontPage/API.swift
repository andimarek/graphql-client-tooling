//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AllBooksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query AllBooks {
      books {
        __typename
        ...BookDetails
      }
    }
    """

  public let operationName = "AllBooks"

  public var queryDocument: String { return operationDefinition.appending(BookDetails.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("books", type: .list(.object(Book.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(books: [Book?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "books": books.flatMap { (value: [Book?]) -> [ResultMap?] in value.map { (value: Book?) -> ResultMap? in value.flatMap { (value: Book) -> ResultMap in value.resultMap } } }])
    }

    public var books: [Book?]? {
      get {
        return (resultMap["books"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Book?] in value.map { (value: ResultMap?) -> Book? in value.flatMap { (value: ResultMap) -> Book in Book(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Book?]) -> [ResultMap?] in value.map { (value: Book?) -> ResultMap? in value.flatMap { (value: Book) -> ResultMap in value.resultMap } } }, forKey: "books")
      }
    }

    public struct Book: GraphQLSelectionSet {
      public static let possibleTypes = ["Book"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(BookDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(author: String? = nil, title: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Book", "author": author, "title": title])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var bookDetails: BookDetails {
          get {
            return BookDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct BookDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment BookDetails on Book {
      __typename
      author
      title
    }
    """

  public static let possibleTypes = ["Book"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("author", type: .scalar(String.self)),
    GraphQLField("title", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(author: String? = nil, title: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Book", "author": author, "title": title])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var author: String? {
    get {
      return resultMap["author"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "author")
    }
  }

  public var title: String? {
    get {
      return resultMap["title"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }
}
