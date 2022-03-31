//
//  CountryView.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 4/5/21.
//

import SwiftUI

struct CountryView: View {
    
    var country: Country
    
    @State var showStates = false
    @State var showLanguages = false
    
    @State private var condition: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("\(country.emoji)")
                .foregroundColor(.primary)
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .scaleEffect(condition == true ? 1.5 : 0.5)
                .animation(Animation
                            .easeInOut(duration: 3))
                .onAppear { condition = true }
            Text("\(country.name) | \(country.native)")
                .foregroundColor(.primary)
                .font(.system(size: 35, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            Text("Capital: \(country.capital ?? country.name)")
                .foregroundColor(.primary)
                .font(.system(size: 25, weight: .semibold, design: .rounded))
            HStack {
                Image(systemName: "phone.down")
                Text("Code: +\(country.phone)")
                    .foregroundColor(.primary)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
            }
            HStack {
                Text("Please rate: ")
                    .foregroundColor(.primary)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                RatingView(rating: 0)
            }
            Form {
                
                Section(header: getHeaderStatesView()) {
                    if (self.showStates && !country.states.isEmpty) {
                        VStack {
                            List {
                                ForEach(country.states, id: \.self) { row in
                                    getStateView(for: row)
                                }
                            }
                            .padding()
                        }
                        .listRowBackground(Color.primary.colorInvert())
                    }
                }
                Section(header: getHeaderLanguageView()) {
                    if (self.showLanguages && !country.languages.isEmpty) {
                        VStack {
                            List {
                                ForEach(country.languages, id: \.self) { row in
                                    getLanguageView(for: row)
                                }
                            }
                            .padding()
                        }
                        .listRowBackground(Color.primary.colorInvert())
                    }
                }
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Country")
    }
    
    func getHeaderStatesView() -> some View {
        Button(action: {
            withAnimation {
                self.showStates.toggle()
            }
        }) {
            HStack {
                Text("States")
                    .foregroundColor(.primary)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Spacer()
                Image(systemName: "chevron.right.circle")
                    .rotationEffect(.degrees(self.showStates ? 90 : 0))
                    .animation(.linear)
                    .foregroundColor(.blue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
            }
        }
    }
    
    func getHeaderLanguageView() -> some View {
        Button(action: {
            withAnimation {
                self.showLanguages.toggle()
            }
        }) {
            HStack {
                Text("Languages")
                    .foregroundColor(.primary)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Spacer()
                Image(systemName: "chevron.right.circle")
                    .rotationEffect(.degrees(self.showLanguages ? 90 : 0))
                    .animation(.linear)
                    .foregroundColor(.blue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
            }
        }
    }
    
    func getStateView(for state: FederalState) -> some View {
        HStack {
            Text("\(state.name) | \(state.code ?? "N.A.")")
                .foregroundColor(.primary)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
            Spacer()
        }
    }
    
    func getLanguageView(for language: Language) -> some View {
        HStack {
            Text("\(language.name ?? "N.A.") | \(language.code)")
                .foregroundColor(.primary)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
            Spacer()
        }
    }
    
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        let country = Country(name: "India",
                              native: "भारत",
                              capital: "New Delhi",
                              emoji: "🇮🇳",
                              currency: "INR",
                              phone: "91",
                              languages: [
                                Language(code: "hi", name: "Hindi"),
                                Language(code: "en", name: "English")
                              ],
                              states: [
                                FederalState(code: "MH", name: "Maharashrta"),
                                FederalState(code: "GJ", name: "Gujarat"),
                                FederalState(code: "AP", name: "Andhra Pradesh")
                              ])
        CountryView(country: country)
    }
}
