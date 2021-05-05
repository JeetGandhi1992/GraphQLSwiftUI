//
//  ApolloPublisher.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 3/5/21.
//

//Inspired from MoyaPublisher
#if canImport(Combine)

import Foundation
import Apollo
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
internal class ApolloPublisher<Output>: Publisher {

    internal typealias Failure = Error

    private class Subscription: Combine.Subscription {
        private let performCall: () -> Apollo.Cancellable?
        private var cancellable: Apollo.Cancellable?

        init(subscriber: AnySubscriber<Output, Error>, callback: @escaping (AnySubscriber<Output, Error>) -> Apollo.Cancellable?) {
            performCall = { callback(subscriber) }
        }

        func request(_ demand: Subscribers.Demand) {
            guard demand > .none else { return }

            cancellable = performCall()
        }

        func cancel() {
            cancellable?.cancel()
        }
    }

    private let callback: (AnySubscriber<Output, Error>) -> Apollo.Cancellable?

    init(callback: @escaping (AnySubscriber<Output, Error>) -> Apollo.Cancellable?) {
        self.callback = callback
    }

    internal func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = Subscription(subscriber: AnySubscriber(subscriber), callback: callback)
        subscriber.receive(subscription: subscription)
    }
}

#endif
