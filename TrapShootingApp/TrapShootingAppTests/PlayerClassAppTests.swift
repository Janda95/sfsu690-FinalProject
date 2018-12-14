//
//  PlayerClassAppTests.swift
//  TrapShootingAppTests
//
//  Created by Aiyana Rettinghouse on 12/13/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import XCTest
@testable import TrapShootingApp

class PlayerClassAppTests: XCTestCase {
    

    
    //test player func average
    func test_average(){
        let player1 = Player("jarek", "rettinghouse")
        player1.Games = [Game("The Game")]
        player1.Games[0].gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        print(player1.Games[0].gamedata)
        let average = player1.avg()
        XCTAssertEqual(1.0, average)
    }
    
    //test player function total hit
    func test_totalhit_onegame(){
        let player2 = Player("jarek", "rettinghouse")
        player2.Games = [Game("The Game")]
        player2.Games[0].gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        player2.Games[0].gamename = "The Game"
        let totalhit = player2.totalhit()
        XCTAssertEqual("Total Hit: 1 / 25", totalhit)
    }
    
    func test_totalhit_twogames(){
        let player = Player("jarek", "rettinghouse")
        player.Games = [Game("The Game 1"), Game("The Game 2")]
        player.Games[0].gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        player.Games[0].gamename = "The Game"
        player.Games[1].gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        player.Games[0].gamename = "The Game Two"
        let totalhit = player.totalhit()
        XCTAssertEqual("Total Hit: 2 / 50", totalhit)
    }
    
    func test_lastGameTime(){
        let player = Player("jarek", "rettinghouse")
        player.Games.append(Game())
        player.Games[0].gamedata =
            [1, 2, 2, 2, 2,
             1, 1, 2, 2, 2,
             1, 1, 1, 2, 2,
             1, 1, 1 ,1, 2,
             1, 1, 1, 1, 1]
        player.Games[0].gamename = "The Game"
        let lastTime = player.lastGameTime()
        XCTAssertEqual(player.Games[0].date.description, lastTime)
        
    }
    
}
