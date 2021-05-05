//
//  Network.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 3/5/21.
//

import Foundation
import Apollo
import Combine

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    
    func fetchPublisher<T: GraphQLQuery>(query: T, cachePolicy: CachePolicy = .default) -> AnyPublisher<GraphQLResult<T.Data>, Error> {
        ApolloPublisher { [weak self] subscriber in
            return self?.apollo.fetch(query: query, cachePolicy: cachePolicy) { result in
                   switch result {
                   case let .success(response):
                       _ = subscriber.receive(response)
                       subscriber.receive(completion: .finished)
                   case let .failure(error):
                       subscriber.receive(completion: .failure(error))
                   }
            }
        }
        .eraseToAnyPublisher()
    }
}



