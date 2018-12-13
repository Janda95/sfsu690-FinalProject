
import Foundation

class Game: Codable{
    //default array representing empty data
    var gamedata: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var date: Date
    
    var shot1: Int = 0
    var shot2: Int = 0
    var shot3: Int = 0
    var shot4: Int = 0
    var shot5: Int = 0
    
    var shot6: Int = 0
    var shot7: Int = 0
    var shot8: Int = 0
    var shot9: Int = 0
    var shot10: Int = 0
    
    var shot11: Int = 0
    var shot12: Int = 0
    var shot13: Int = 0
    var shot14: Int = 0
    var shot15: Int = 0
    
    var shot16: Int = 0
    var shot17: Int = 0
    var shot18: Int = 0
    var shot19: Int = 0
    var shot20: Int = 0
    
    var shot21: Int = 0
    var shot22: Int = 0
    var shot23: Int = 0
    var shot24: Int = 0
    var shot25: Int = 0
    
    //For displaying information
    var gamename: String = "Game"
    var dataString: String = "Shots: "
    
    //Coding Keys
    private enum CodingKeysGames: String, CodingKey{
        case date
        case gamedata
        case gamename
    }
    
    //decode Game information
    required init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeysGames.self)
        date = try! values.decode(Date.self, forKey: .date)
        gamename = try! values.decode(String.self, forKey: .gamename)
        gamedata = (try! values.decode([Int].self, forKey: .gamedata))
        print(gamedata)
    }
    
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
