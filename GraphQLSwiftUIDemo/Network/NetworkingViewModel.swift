//
//  NetworkingViewModel.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 3/5/21.
//

import Foundation
import Combine


protocol CustomError : Error {
    var localizedDescription: String { get }
}

public enum AppError: String, CustomError {
   
    case unknown = "Unknown Error"
    case apiKeyError = "The request is missing a valid API key."
    case decodingError = "Failed to map data to a Decodable object."
    case somethingWentWrong = "Something went wrong!"
    
}

enum RequestError : Int, CustomError {
    
    case unknown            = -5000
    case badRequest         = 400
    case loginFailed        = 401
    case userDisabled       = 403
    case notFound           = 404
    case methodNotAllowed   = 405
    case serverError        = 500
    case noConnection       = -1009
    case timeOutError       = -1001

}

public protocol NetworkingViewModel {
    associatedtype EventType: MapsToNetworkEvent

    var events: EventType? { get }
}

public protocol MapsToNetworkEvent {
    func toNetworkEvent() -> NetworkingUIEvent<()>?
}

public enum NetworkingUIEvent<ResponseType> {
    case waiting
    case succeeded(ResponseType)
    case failed(Error)

    public func ignoreResponse() -> NetworkingUIEvent<()> {
        switch self {
            case .succeeded:
                return .succeeded(())
            case .failed(let error):
                return .failed(error)
            case .waiting:
                return .waiting
        }
    }
}

extension NetworkingUIEvent: Equatable {

    public static func == (lhs: NetworkingUIEvent, rhs: NetworkingUIEvent) -> Bool {
        switch (lhs, rhs) {
            case (.waiting, .waiting):
                return true
            case (.succeeded, .succeeded):
                return true
            case (.failed(let errorA), .failed(let errorB)):
                return errorA.localizedDescription == errorB.localizedDescription
            default:
                return false
        }
    }
}

extension NetworkingUIEvent: Error {
    
}
