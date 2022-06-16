//
//  ContextModifier.swift
//  InstaFeedLayout
//
//  Created by Магомед Ахильгов on 16.06.2022.
//

import SwiftUI

struct ContextModifier: ViewModifier {
    var card: Card
    
    func body(content: Content) -> some View {
        content.contextMenu {
            Text("By \(card.author)")
        }
        .contentShape(RoundedRectangle(cornerRadius: 5))
    }
}

