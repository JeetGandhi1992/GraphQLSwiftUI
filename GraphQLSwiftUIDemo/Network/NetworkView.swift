//
//  NetworkView.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 5/5/21.
//

import SwiftUI
import Combine

public protocol ViewProtocol {
    associatedtype ViewModelT
    var viewModel: ViewModelT! { get set }
}

public protocol NetworkingView: ViewProtocol where Self: View, ViewModelT: NetworkingViewModel {

    var cancelBag: CancelBag { get }
    var isLoading: Bool { get }
    func setupNetworkingEventsUI()
    func setupLoadingSpinner()
}

extension View {
    @ViewBuilder
    func handleNetworkEvents<T: MapsToNetworkEvent>(publisher: Published<T?>.Publisher,
                             perform action: @escaping (T?) -> Void) -> some View {
        onReceive(publisher, perform: { event in
            action(event)
        })
    }
}
