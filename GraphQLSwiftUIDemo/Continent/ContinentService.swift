//
//  ContinentService.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 4/5/21.
//

import Foundation
import Combine
import Apollo

public protocol ContinentServiceType {
    func fetchContinents(cachePolicy: CachePolicy) -> AnyPublisher<NetworkingUIEvent<Continents>, Error>
}

public class ContinentService: ContinentServiceType {
        
    public func fetchContinents(cachePolicy: CachePolicy = .default) -> AnyPublisher<NetworkingUIEvent<Continents>, Error> {
        let publisher: AnyPublisher<NetworkingUIEvent<Continents>, Error> = Network.shared
            .fetchPublisher(query: AllContinentsQuery())
            .map { graphQLResult -> NetworkingUIEvent<Continents> in
                if let graphQLContinents = graphQLResult.data?.continents
                {
                    let continents = graphQLContinents
                        .map({ Continent(continent: $0) })
                    return NetworkingUIEvent.succeeded(continents)
                } else {
                    return NetworkingUIEvent.failed(AppError.somethingWentWrong)
                }
            }
            .prepend(.waiting)
            .eraseToAnyPublisher()
        
        return publisher
    }
    
}
