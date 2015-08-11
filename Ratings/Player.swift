//
//  Player.swift
//  Ratings
//
//  Created by Edwin Guzman Marte on 8/10/15.
//  Copyright (c) 2015 EdGuz. All rights reserved.
//

import Foundation

class Player: NSObject {
    
    var name: String
    var game: String
    var rating: Int
    
    init(name: String, game: String, rating: Int){
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
    
}