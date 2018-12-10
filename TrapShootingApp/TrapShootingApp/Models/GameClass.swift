
import Foundation

struct Game {
    
    var gamedata: [Int] = Array(repeating: 0, count: 25)
    
    var date: Date
    
    var gamename: String = "Game"
    
    init() {
        date = Date()
    }
    //init gamename
    init(_ name: String){
        date = Date()
        gamename = name
    }
    
    func returnDataString() -> String {
        var dataString: String = "Shots: "
        
        for shot in gamedata {
            switch gamedata[shot]{
            case 0:
                dataString = dataString + " -"
            case 1:
                dataString = dataString + " H"
            case 2:
                dataString = dataString + " M"
            default:
                break
            }
            switch shot {
            case 4:
                dataString = dataString + "  "
            case 14:
                dataString = dataString + "  "
            case 9:
                dataString = dataString + "\n"
            case 19:
                dataString = dataString + "\n"
            default:
                break
            }
        }
        
        return dataString
    }
}
