//
//  EmojiRatingView.swift
//  BookWorm
//
//  Created by Kristoffer Eriksson on 2021-03-27.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("đĒ")
        case 2:
            return Text("âšī¸")
        case 3:
            return Text("đ")
        case 4:
            return Text("đ")
        default:
            return Text("đ")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
