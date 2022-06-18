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
    @Environment(\.presentationMode) var presentation
    @Environment(\.editMode) private var editMode
    @State private var firstName: String = ""
    @State private var lastName: String = ""

    var card: Card
    var body: some View {
        ZStack {
            if cardDetailViewModel.isProgress {
                ProgressView("Loading")
                    .zIndex(1)
                    .font(.title)
            }
            VStack {
                AsyncImage(url: URL(string: card.image))
                    .background(Color.white)
                HStack {
                    Text("First Name: ").fontWeight(.semibold).lineLimit(2).minimumScaleFactor(1)
                    TextField("First Name", text: $firstName, onEditingChanged: { (isChanges) in
                               // On Editing Changed
                           }) {
                               // On Commit
                           }
                           .textContentType(.name)
                           .multilineTextAlignment(.center)
                           .disabled(!editMode!.wrappedValue.isEditing)
                           .textFieldStyle(RoundedBorderTextFieldStyle.init())
                }
                HStack {
                    Text("Last Name: ").fontWeight(.semibold).lineLimit(2).minimumScaleFactor(1)
                    TextField("Last Name", text: $lastName, onEditingChanged: { (isChanges) in
                               // On Editing Changed
                           }) {
                               // On Commit
                           }
                           .textContentType(.name)
                           .multilineTextAlignment(.center)
                           .disabled(!editMode!.wrappedValue.isEditing)
                           .textFieldStyle(RoundedBorderTextFieldStyle.init())
                }
                Text("Email: " + (cardDetailViewModel.cardDetail?.email ?? "")).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(1)
                Text("Date Of Birth: " + (cardDetailViewModel.cardDetail?.dateOfBirth ?? "")).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(1)
                Spacer()
                Button {
                    cardDetailViewModel.delete()
                } label: {
                    Text("DELETE")
                        .foregroundColor(Color.red)
                        .fontWeight(.heavy)
                }
            }
            .onAppear {
                cardDetailViewModel.card = card
                cardDetailViewModel.fetch()
                firstName = card.firstName
                lastName = card.lastName
            }
            .toolbar {
                EditButton()
            }
            .onChange(of: cardDetailViewModel.isDelete) { newValue in
                if cardDetailViewModel.isDelete {
                    self.presentation.wrappedValue.dismiss()
                }
            }
            .onChange(of: editMode!.wrappedValue, perform: { value in
              if value.isEditing {
                 // Entering edit mode (e.g. 'Edit' tapped)
                  print("edit")
              } else {
                 // Leaving edit mode (e.g. 'Done' tapped)
                  print("done")
                  cardDetailViewModel.edit(firstName: firstName, lastName: lastName)
              }
            })
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: Card(js: JSON.null))
    }
}
