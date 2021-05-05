//
//  Continent.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 3/5/21.
//

import Foundation

public typealias Continents = [Continent]

public struct Continent: Identifiable, Hashable {
    public var id = UUID()
    
    public var code: String
    public var name: String
    public var countries: [Country]
    
    init(code: String, name: String, countries: [Country]) {
        self.code = code
        self.name = name
        self.countries = countries
    }
    
    init(continent: AllContinentsQuery.Data.Continent) {
        self.code = continent.code
        self.name = continent.name
        self.countries = continent.countries.map { Country(country: $0) }
    }
    
    public static func == (lhs: Continent, rhs: Continent) -> Bool {
        lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name + code)
    }
}

public struct Country: Identifiable, Hashable {
    
    public let id = UUID()
    
    public let name: String
    public let native: String
    public let capital: String?
    public let currency: String?
    public let emoji: String
    public let phone: String
    public let languages: [Language]
    public let states: [FederalState]
    
    
    init(name: String, native: String, capital: String?, emoji: String, currency: String?, phone: String, languages: [Language], states: [FederalState]) {
        self.name = name
        self.native = native
        self.capital = capital
        self.emoji = emoji
        self.currency = currency
        self.phone = phone
        self.languages = languages
        self.states = states
    }
    
    init(country: AllContinentsQuery.Data.Continent.Country) {
        self.init(name: country.name,
                  native: country.native,
                  capital: country.capital,
                  emoji: country.emoji,
                  currency: country.currency,
                  phone: country.phone,
                  languages: country.languages.map { Language(language: $0) },
                  states: country.states.map { FederalState(state: $0) })
    }
    
    public static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name + (capital ?? ""))
    }
}

public struct FederalState: Identifiable, Hashable {
    public let id = UUID()
    public var code: String?
    public var name: String
    
    init(code: String?, name: String) {
        self.code = code
        self.name = name
    }
    
    init(state: AllContinentsQuery.Data.Continent.Country.State) {
        self.code = state.code
        self.name = state.name
    }
    
    public static func == (lhs: FederalState, rhs: FederalState) -> Bool {
        lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name + (code ?? ""))
    }
}

public struct Language: Identifiable, Hashable {
    public let id = UUID()
    public var code: String
    public var name: String?
    
    init(code: String, name: String?) {
        self.code = code
        self.name = name
    }
    
    init(language: AllContinentsQuery.Data.Continent.Country.Language) {
        self.code = language.code
        self.name = language.name
    }
    
    public static func == (lhs: Language, rhs: Language) -> Bool {
        lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(code + (name ?? ""))
    }
    
}
