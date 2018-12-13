//
//  PlayerClass.swift
//  TrapShootingApp
//
//  Created by Jarek Rettinghouse on 12/1/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import Foundation

class Player: Codable {
    
    //Data Variables
    var fullname: String
    var username: String
    var Games: [Game] = []
    
    //Coding Keys
    enum CodingKeys: String, CodingKey{
        case fullname
        case username
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fullname = try! values.decode(String.self, forKey: .fullname)
        username = try! values.decode(String.self, forKey: .username)
        
        //Decode Game Data and place in game array
        guard let dataFromStorage = UserDefaults.standard.object(forKey: "Games") as? Data else {
            return
        }
        let decoder = JSONDecoder()
        let tempArray = try! decoder.decode([Game].self, from: dataFromStorage)
        Games = Games + tempArray
    }
    
    //encode function for games to call in main function in encode players
    func encodeGames(){
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(Games)
        UserDefaults.standard.set(encoded, forKey: "Games")
    }
    
    
    init(_ fullname: String, _ username: String){
        self.fullname = fullname
        self.username = username
        Games = []
        //for testing
    }
    
    func getName() -> String{
        return username
    }
    
    //average over all games
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
    
    //Most Recent game played time of creation
    func lastGameTime() -> String {
        if Games.count == 0 {
            return "N/A"
        } else {
            let temp = Games.count
            let date = Games[temp - 1].date
            return date.description
        }
    }
    
    //total hit in all games / total shots
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
