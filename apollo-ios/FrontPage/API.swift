//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct UpdateBookTitleInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, title: String) {
    graphQLMap = ["id": id, "title": title]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }
}

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

      public init(author: String? = nil, title: String, id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Book", "author": author, "title": title, "id": id])
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

public final class UpdateBookTitleMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation UpdateBookTitle($input: UpdateBookTitleInput!) {
      updateBookTitle(input: $input) {
        __typename
        success
        message
        book {
          __typename
          id
          title
        }
      }
    }
    """

  public let operationName = "UpdateBookTitle"

  public var input: UpdateBookTitleInput

  public init(input: UpdateBookTitleInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateBookTitle", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateBookTitle.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateBookTitle: UpdateBookTitle? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateBookTitle": updateBookTitle.flatMap { (value: UpdateBookTitle) -> ResultMap in value.resultMap }])
    }

    public var updateBookTitle: UpdateBookTitle? {
      get {
        return (resultMap["updateBookTitle"] as? ResultMap).flatMap { UpdateBookTitle(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateBookTitle")
      }
    }

    public struct UpdateBookTitle: GraphQLSelectionSet {
      public static let possibleTypes = ["UpdateBookTitleResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("message", type: .scalar(String.self)),
        GraphQLField("book", type: .object(Book.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(success: Bool, message: String? = nil, book: Book? = nil) {
        self.init(unsafeResultMap: ["__typename": "UpdateBookTitleResponse", "success": success, "message": message, "book": book.flatMap { (value: Book) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var success: Bool {
        get {
          return resultMap["success"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }

      public var message: String? {
        get {
          return resultMap["message"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }

      public var book: Book? {
        get {
          return (resultMap["book"] as? ResultMap).flatMap { Book(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "book")
        }
      }

      public struct Book: GraphQLSelectionSet {
        public static let possibleTypes = ["Book"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String) {
          self.init(unsafeResultMap: ["__typename": "Book", "id": id, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
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
      id
    }
    """

  public static let possibleTypes = ["Book"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("author", type: .scalar(String.self)),
    GraphQLField("title", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(author: String? = nil, title: String, id: GraphQLID) {
    self.init(unsafeResultMap: ["__typename": "Book", "author": author, "title": title, "id": id])
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

  public var title: String {
    get {
      return resultMap["title"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }
}
