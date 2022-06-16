//
//  Card.swift
//  InstaFeedLayout
//
//  Created by Магомед Ахильгов on 16.06.2022.
//

import Foundation

struct Card: Identifiable, Decodable, Hashable {
    var id: String
    var download_url: String
    var author: String
}
