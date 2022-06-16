//
//  JSONViewModel.swift
//  InstaFeedLayout
//
//  Created by Магомед Ахильгов on 16.06.2022.
//

import Foundation

class JSONViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var search = ""
    @Published var compositionalArray: [[Card]] = []
    
    init() {
        fetchJSON()
    }
    
    func fetchJSON() {
        let url = "https://picsum.photos/v2/list?page=2&limit=100"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let json = data else { return }
            let jsonValues = try? JSONDecoder().decode([Card].self, from: json)
            guard let cards = jsonValues else { return }
            
            DispatchQueue.main.async {
                self.cards = cards
                self.setCompositionalLayout()
            }
        }
        .resume()
    }
    
    func setCompositionalLayout() {
        var currentArrayCards: [Card] = []
        
        cards.forEach { (card) in
            
            currentArrayCards.append(card)
            
            if currentArrayCards.count == 3 {
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
            
            if currentArrayCards.count != 3 && card.id == cards.last!.id {
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
        }
    }
}
