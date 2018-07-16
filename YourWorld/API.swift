//  This file was automatically generated and should not be edited.

import Apollo

public final class PostsQuery: GraphQLQuery {
  public let operationDefinition =
    "query Posts {\n  feed {\n    __typename\n    posts {\n      __typename\n      id\n      title\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("feed", type: .nonNull(.object(Feed.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(feed: Feed) {
      self.init(unsafeResultMap: ["__typename": "Query", "feed": feed.resultMap])
    }

    public var feed: Feed {
      get {
        return Feed(unsafeResultMap: resultMap["feed"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "feed")
      }
    }

    public struct Feed: GraphQLSelectionSet {
      public static let possibleTypes = ["Feed"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("posts", type: .nonNull(.list(.nonNull(.object(Post.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(posts: [Post]) {
        self.init(unsafeResultMap: ["__typename": "Feed", "posts": posts.map { (value: Post) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var posts: [Post] {
        get {
          return (resultMap["posts"] as! [ResultMap]).map { (value: ResultMap) -> Post in Post(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Post) -> ResultMap in value.resultMap }, forKey: "posts")
        }
      }

      public struct Post: GraphQLSelectionSet {
        public static let possibleTypes = ["Post"]

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
          self.init(unsafeResultMap: ["__typename": "Post", "id": id, "title": title])
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