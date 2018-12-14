//
//  GameClassAppTests.swift
//  TrapShootingAppTests
//
//  Created by Aiyana Rettinghouse on 12/13/18.
//  Copyright © 2018 JLR. All rights reserved.
//

import XCTest
@testable import TrapShootingApp

class GameClassAppTests: XCTestCase {
    
    
    
    //test player func average
    func test_returnDataStringfunc(){
        let game = Game("The Game")
        game.gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        XCTAssertEqual(game.returnDataString(), "Shots:  H M M M M M M M M M M M M M M M M M M M M M M M M")
    }
    
    //test player function total hit
    func test_completioncheckFunc(){
        let game = Game("The Game")
        game.gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0]
        XCTAssertEqual(game.checkCompletion(), 1)
    }
    
    func test_totalhitFunc(){
        let game = Game("The Game")
        game.gamedata = [1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        XCTAssertEqual(game.totalHit(), 2)
    }
    
    func test_first5(){
        let game = Game("The Game")
        game.gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        XCTAssertEqual(game.first5()," H M M M M")
    }
    
    func test_second5(){
        let game = Game("The Game")
        game.gamedata = [1, 2, 2, 2, 2, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        XCTAssertEqual(game.second5()," H M H M H")
    }
    
    func test_third5(){
        let game = Game("The Game")
        game.gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        XCTAssertEqual(game.third5()," M M M M M")
    }
    
    func test_fourth(){
        let game = Game("The Game")
        game.gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 2, 2]
        XCTAssertEqual(game.fourth5()," M M M H H")
    }
    
    func test_fifth5(){
        let game = Game("The Game")
        game.gamedata = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1]
        XCTAssertEqual(game.fifth5()," M M M M H")
    }
    
}
