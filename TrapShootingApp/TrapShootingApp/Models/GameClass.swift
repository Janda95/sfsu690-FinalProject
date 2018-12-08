
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
}
