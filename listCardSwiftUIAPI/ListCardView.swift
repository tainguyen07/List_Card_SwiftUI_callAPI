//
//  ContentView.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 18/06/2022.
//

import SwiftUI

struct ListCardView: View {
    @StateObject var listCardViewModel = ListCardViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listCardViewModel.cards, id: \.self) { card in
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView()
    }
}
