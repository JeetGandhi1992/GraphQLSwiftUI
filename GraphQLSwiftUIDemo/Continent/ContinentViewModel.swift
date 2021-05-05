//
//  ContinentViewModel.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 3/5/21.
//

import Foundation
import Apollo
import Combine
import SwiftUI

public enum ContinentViewModelEvents {
    case getContinents(NetworkingUIEvent<Continents>)
    case ignore
}

extension ContinentViewModelEvents: Equatable {
    public static func == (lhs: ContinentViewModelEvents, rhs: ContinentViewModelEvents) -> Bool {
        switch (lhs, rhs) {
            case (.getContinents(let lContinents), .getContinents(let rContinents)):
                return lContinents == rContinents
            case (.ignore, .ignore):
                return true
            default:
                return false
        }
    }
}

extension ContinentViewModelEvents: MapsToNetworkEvent {
    public func toNetworkEvent() -> NetworkingUIEvent<()>? {
        switch self {
            case .getContinents(let event):
                return event.ignoreResponse()
            case .ignore:
                return nil
        }
    }
}

class ContinentViewModel: ObservableObject, NetworkingViewModel {
    
    @Published var events: ContinentViewModelEvents? 
    
    var continents: [Continent]? = []
    var message: String = ""
    var cancelBag = CancelBag()
    var service = ContinentService()
    
    var placeholders = Array(repeating: Continent(code: "", name: "", countries: [Country]()), count: 20)
    
    
    init() {
        
    }
    
    public func getAllContinents(cachePolicy: CachePolicy = .default)  {
        
        service.fetchContinents(cachePolicy: cachePolicy)
            .sink { [weak self] (completion) in
                if case let .failure(error) = completion {
                    self?.events = .getContinents(.failed(error))
                }
            } receiveValue: { [weak self] (event) in
                self?.events = .getContinents(event)
            }
            .cancel(with: cancelBag)
    }
}
