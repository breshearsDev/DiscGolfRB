//
//  Score.swift
//  DiscGolfRB
//
//  Created by Breshears, Rob - CTC on 10/28/25.
//

import Foundation

class Score: ObservableObject {
    @Published var myScore: Int
    
    init() {
        myScore = 0
    }
}
