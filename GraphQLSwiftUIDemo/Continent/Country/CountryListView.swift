//
//  CountryListView.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 5/5/21.
//

import SwiftUI

struct CountryListView: View {
    
    var continent: Continent
    @State private var selectCountry: Country? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(continent.countries, id: \.id) { country in
                getCountryRowView(for: country)
            }
        }
        .listRowBackground(Color.primary.colorInvert())
    }
    
    func getCountryRowView(for country: Country) -> some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            NavigationLink(destination: CountryView(country: country),
                           tag: country,
                           selection: $selectCountry) {
                EmptyView()
            }
            HStack {
                Text("\(country.emoji) \(country.name)")
                    .foregroundColor(.primary)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
            }
            
        }
        .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
        .background(Color.primary.colorInvert())
        .onTapGesture {
            self.selectCountry = country
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
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
        CountryListView(continent: Continent(code: "As",
                                             name: "ASIA",
                                             countries: [country]))
    }
}
