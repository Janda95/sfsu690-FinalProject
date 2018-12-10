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
    
}
