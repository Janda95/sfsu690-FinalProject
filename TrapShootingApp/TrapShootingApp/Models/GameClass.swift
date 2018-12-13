
import Foundation

struct Game {
    //default array representing empty data
    var gamedata: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var date: Date
    
    //For displaying information
    var gamename: String = "Game"
    var dataString: String = "Shots: "
    
    init() {
        date = Date()
    }
    //init gamename
    init(_ name: String){
        date = Date()
        gamename = name
    }
    
    //creates string that represents the shots taken for the game
    func returnDataString() -> String {
        var dataString: String = "Shots: "
        
        //loops through gamedata
        for shot in gamedata {
            if shot == 1 {
                dataString = dataString + " H"
            } else if shot == 2 {
                dataString = dataString + " M"
            } else {
                dataString = dataString + " -"
            }
            //spacing in between every 5 shots
            if shot == 4 || shot == 14 || shot == 9 || shot == 19 {
                dataString = dataString + "  "
            }
        }
        
        return dataString
    }
    
    //check if there are no missing datapoints
    func checkCompletion() -> Int{
        //Zero represents an empty entry
        var numberOfZeros: Int = 0
        //find zeros
        for shot in gamedata {
            if gamedata[shot] == 0 {
                numberOfZeros = numberOfZeros + 1
            }
        }
        return numberOfZeros
    }
    
    //total hit in a game
    func totalHit() -> Int {
        var counter: Int = 0
        for shot in gamedata {
            if gamedata[shot] == 1 {
                counter = counter + 1
            }
        }
        return counter
    }
    
    
    func first5() -> String {
        var fiveShots: String = ""
        
        for i in 0..<5 {
            if gamedata[i] == 1 {
                fiveShots = fiveShots + " H"
            } else if gamedata[i] == 2 {
                fiveShots = fiveShots + " M"
            } else {
                fiveShots = fiveShots + " -"
            }
        }
        return fiveShots
    }
    
    func second5() -> String {
        var fiveShots: String = ""
        
        for i in 5..<10 {
            if gamedata[i] == 1 {
                fiveShots = fiveShots + " H"
            } else if gamedata[i] == 2 {
                fiveShots = fiveShots + " M"
            } else {
                fiveShots = fiveShots + " -"
            }
        }
        return fiveShots
    }
    
    func third5() -> String {
        var fiveShots: String = ""
        
        for i in 10..<15 {
            if gamedata[i] == 1 {
                fiveShots = fiveShots + " H"
            } else if gamedata[i] == 2 {
                fiveShots = fiveShots + " M"
            } else {
                fiveShots = fiveShots + " -"
            }
        }
        return fiveShots
    }
    
    func fourth5() -> String {
        var fiveShots: String = ""
        
        for i in 15..<20 {
            if gamedata[i] == 1 {
                fiveShots = fiveShots + " H"
            } else if gamedata[i] == 2 {
                fiveShots = fiveShots + " M"
            } else {
                fiveShots = fiveShots + " -"
            }
        }
        return fiveShots
    }
    
    func fifth5() -> String {
        var fiveShots: String = ""
        
        for i in 20..<25 {
            if gamedata[i] == 1 {
                fiveShots = fiveShots + " H"
            } else if gamedata[i] == 2 {
                fiveShots = fiveShots + " M"
            } else {
                fiveShots = fiveShots + " -"
            }
        }
        return fiveShots
    }
}
