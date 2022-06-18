//
//  CardDetailView.swift
//  listCardSwiftUI
//
//  Created by Tai Nguyen on 18/06/2022.
//

import SwiftUI
import SwiftyJSON
struct CardDetailView: View {
    @StateObject var cardDetailViewModel = CardDetailViewModel()
    var card: Card
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: card.image))
                .background(Color.white)
            Text("First Name: " + (cardDetailViewModel.cardDetail?.firstName ?? "")).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(1)
            Text("Last Name: " + (cardDetailViewModel.cardDetail?.lastName ?? "")).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(1)
            Text("Email: " + (cardDetailViewModel.cardDetail?.email ?? "")).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(1)
            Text("Date Of Birth: " + (cardDetailViewModel.cardDetail?.dateOfBirth ?? "")).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(1)
            Spacer()
            Button {
                
            } label: {
                Text("DELETE")
                    .foregroundColor(Color.red)
                    .fontWeight(.heavy)
            }


        }.onAppear {
            cardDetailViewModel.card = card
            cardDetailViewModel.fetch()
        }
        .toolbar {
            EditButton()
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: Card(js: JSON.null))
    }
}