// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AllContinentsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query allContinents {
      continents {
        __typename
        code
        name
        countries {
          __typename
          name
          native
          capital
          currency
          emoji
          phone
          languages {
            __typename
            code
            name
          }
          states {
            __typename
            name
            code
          }
        }
      }
    }
    """

  public let operationName: String = "allContinents"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("continents", type: .nonNull(.list(.nonNull(.object(Continent.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(continents: [Continent]) {
      self.init(unsafeResultMap: ["__typename": "Query", "continents": continents.map { (value: Continent) -> ResultMap in value.resultMap }])
    }

    public var continents: [Continent] {
      get {
        return (resultMap["continents"] as! [ResultMap]).map { (value: ResultMap) -> Continent in Continent(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Continent) -> ResultMap in value.resultMap }, forKey: "continents")
      }
    }

    public struct Continent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Continent"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("countries", type: .nonNull(.list(.nonNull(.object(Country.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(code: GraphQLID, name: String, countries: [Country]) {
        self.init(unsafeResultMap: ["__typename": "Continent", "code": code, "name": name, "countries": countries.map { (value: Country) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var code: GraphQLID {
        get {
          return resultMap["code"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var countries: [Country] {
        get {
          return (resultMap["countries"] as! [ResultMap]).map { (value: ResultMap) -> Country in Country(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Country) -> ResultMap in value.resultMap }, forKey: "countries")
        }
      }

      public struct Country: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Country"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("native", type: .nonNull(.scalar(String.self))),
            GraphQLField("capital", type: .scalar(String.self)),
            GraphQLField("currency", type: .scalar(String.self)),
            GraphQLField("emoji", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .nonNull(.scalar(String.self))),
            GraphQLField("languages", type: .nonNull(.list(.nonNull(.object(Language.selections))))),
            GraphQLField("states", type: .nonNull(.list(.nonNull(.object(State.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, native: String, capital: String? = nil, currency: String? = nil, emoji: String, phone: String, languages: [Language], states: [State]) {
          self.init(unsafeResultMap: ["__typename": "Country", "name": name, "native": native, "capital": capital, "currency": currency, "emoji": emoji, "phone": phone, "languages": languages.map { (value: Language) -> ResultMap in value.resultMap }, "states": states.map { (value: State) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var native: String {
          get {
            return resultMap["native"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "native")
          }
        }

        public var capital: String? {
          get {
            return resultMap["capital"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "capital")
          }
        }

        public var currency: String? {
          get {
            return resultMap["currency"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "currency")
          }
        }

        public var emoji: String {
          get {
            return resultMap["emoji"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "emoji")
          }
        }

        public var phone: String {
          get {
            return resultMap["phone"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var languages: [Language] {
          get {
            return (resultMap["languages"] as! [ResultMap]).map { (value: ResultMap) -> Language in Language(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Language) -> ResultMap in value.resultMap }, forKey: "languages")
          }
        }

        public var states: [State] {
          get {
            return (resultMap["states"] as! [ResultMap]).map { (value: ResultMap) -> State in State(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: State) -> ResultMap in value.resultMap }, forKey: "states")
          }
        }

        public struct Language: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Language"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("code", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(code: GraphQLID, name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Language", "code": code, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var code: GraphQLID {
            get {
              return resultMap["code"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "code")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct State: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["State"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("code", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, code: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "State", "name": name, "code": code])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var code: String? {
            get {
              return resultMap["code"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "code")
            }
          }
        }
      }
    }
  }
}

public final class SpecificCountryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SpecificCountry {
      country(code: "IN") {
        __typename
        name
        native
        capital
        currency
        emoji
      }
    }
    """

  public let operationName: String = "SpecificCountry"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("country", arguments: ["code": "IN"], type: .object(Country.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(country: Country? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "country": country.flatMap { (value: Country) -> ResultMap in value.resultMap }])
    }

    public var country: Country? {
      get {
        return (resultMap["country"] as? ResultMap).flatMap { Country(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "country")
      }
    }

    public struct Country: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Country"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("native", type: .nonNull(.scalar(String.self))),
          GraphQLField("capital", type: .scalar(String.self)),
          GraphQLField("currency", type: .scalar(String.self)),
          GraphQLField("emoji", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, native: String, capital: String? = nil, currency: String? = nil, emoji: String) {
        self.init(unsafeResultMap: ["__typename": "Country", "name": name, "native": native, "capital": capital, "currency": currency, "emoji": emoji])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var native: String {
        get {
          return resultMap["native"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "native")
        }
      }

      public var capital: String? {
        get {
          return resultMap["capital"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "capital")
        }
      }

      public var currency: String? {
        get {
          return resultMap["currency"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var emoji: String {
        get {
          return resultMap["emoji"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "emoji")
        }
      }
    }
  }
}
