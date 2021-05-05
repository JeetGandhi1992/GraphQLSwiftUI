//
//  ContinentView.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 3/5/21.
//

import SwiftUI

struct ContinentView: View {
    
    var continentViewModel = ContinentViewModel()
    
    @State var continents: [Continent]? = nil
    @State var isLoading = false
    @State var showDetails: [String : Bool] = [String : Bool]()
    
    @State private var showError: Bool = false
    @State private var error: Error? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    ForEach(continents ?? continentViewModel.placeholders, id: \.id) { continent in
                        Section(header: getHeaderView(for: continent)) {
                            if self.showDetails[continent.name] ?? false {
                                CountryListView(continent: continent)
                            }
                        }
                    }
                }
            }
            .onAppear {
                if continents?.isEmpty ?? true {
                    self.continentViewModel.getAllContinents()
                }
            }
            .handleNetworkEvents(publisher: continentViewModel.$events,
                                 perform: onReceiveNetworkEvents())
            .alert(isPresented: $showError, content: {
                Alert(title: Text("Error"), message: Text(error?.localizedDescription ?? AppError.somethingWentWrong.rawValue), dismissButton: .default(Text("OK"),action: {
                    showError = false
                    error = nil
                }))
            })
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: getRefreshButton())
            .navigationTitle("Continents")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
   
    
    func onReceiveNetworkEvents() -> ((ContinentViewModelEvents?) -> Void) {
       return { event in
            switch event {
                case .none:
                    isLoading = false
                case .some(let networkEvent):
                    switch networkEvent {
                        case .getContinents(.waiting):
                            isLoading = true
                        case .getContinents(.failed(let fetchError)):
                            isLoading = false
                            showError = true
                            error = fetchError
                        case .getContinents(.succeeded(let continents)):
                            isLoading = false
                            self.continents = continents
                            continents.forEach { (continent) in
                                self.showDetails[continent.name] = false
                            }
                        case .ignore:
                            isLoading = false
                    }
            }
        }
    }
        
    func getHeaderView(for continent: Continent) -> some View {
        Button(action: {
            withAnimation {
                self.showDetails[continent.name]?.toggle()
            }
        }) {
            HStack {
                Text(isLoading ? "is Loading......" : continent.name )
                    .foregroundColor(.primary)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .redacted(when: isLoading, redactionType: .shimmer)
                Spacer()
                if (!showError && isLoading) || (!isLoading && !showError && continents != nil) {
                    Image(systemName: "chevron.right.circle")
                        .rotationEffect(.degrees((self.showDetails[continent.name] ?? false) ? 90 : 0))
                        .animation(.linear)
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .redacted(when: isLoading, redactionType: .shimmer)
                }
            }
        }
    }
    
    func getRefreshButton() -> some View {
        Button(action: {
            if !isLoading {
                isLoading = true
                continents = nil
                continentViewModel.getAllContinents(cachePolicy: .fetchIgnoringCacheCompletely)
            }
        }) {
            Image(systemName: "arrow.clockwise.circle")
                .foregroundColor(.blue)
                .font(.system(size: 20))
        }
    }
        
}

struct ContinentView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentView()
    }
}
