//
//  PlayerClass.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import Foundation

class Player: Codable {
    
    var fullname: String
    var username: String
    var Games: [Game] = []
    var average: Double = 0.0
    
    enum CodingKeys: String, CodingKey{
        case fullname
        case username
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fullname = try! values.decode(String.self, forKey: .fullname)
        username = try! values.decode(String.self, forKey: .username)
    }
    
    init(_ fullname: String, _ username: String){
        self.fullname = fullname
        self.username = username
        //for testing
        Games.append(Game())
    }
    
    func getName() -> String{
        return username
    }
    
    func avg() -> Double{
        if Games.count == 0 {
            return 0.0
        }
        let totalGames = Games.count
        var totalH: Double = 0
        for game in Games {
            let temp: Double = Double(game.totalHit())
            totalH = totalH + temp
        }
        return totalH / Double(totalGames)
    }
    
    func lastGameTime() -> String {
        if Games.count == 0 {
            return "N/A"
        } else {
            let temp = Games.count
            let date = Games[temp - 1].date
            return date.description
        }
    }
    
    func totalhit() -> String {
        let totalGames = Games.count
        let totalShots = totalGames*25
        var totalH: Int = 0
        for game in Games {
            let temp = game.totalHit()
            totalH = totalH + temp
        }
        let totalString = "Total Hit: " + String(totalH) + " / " + String(totalShots)
        
        return totalString
    }
    
}
