
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
    
}
