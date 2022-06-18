//
//  ContentView.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 18/06/2022.
//

import SwiftUI

struct ListCardView: View {
    @StateObject var listCardViewModel = ListCardViewModel()
    @State private var searchText = ""
    var searchResults: [Card] {
            if searchText.isEmpty {
                return listCardViewModel.cards
            } else {
                return listCardViewModel.cards.filter { $0.firstName.contains(searchText) || $0.lastName.contains(searchText)}
            }
        }
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { card in
                    NavigationLink(destination: CardDetailView(card: card)) {
                        HStack {
                            AsyncImage(url: URL(string: card.image))
                                .scaledToFit()
                                .frame(height: 70)
                                .background(Color.gray)
                            
                            Text(card.firstName + " " + card.lastName)
                                .bold()
                        }
                    }
                    
                }
            }
            .navigationTitle("List Card")
            .onAppear {
                listCardViewModel.fetch()
            }
            .searchable(text: $searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView()
    }
}
