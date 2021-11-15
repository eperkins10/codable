import UIKit

var str = "Hello, playground"

struct Movie: Codable {
    var name: String
    var sales: Int
    var rating: String
    var score: Double
}



let deadpoolJson = """
{
    "name" : "Deadpool",
    "sales" : "36302400",
    "rating" : "R",
    "reviewScore" : "4.5"
}
"""

let jd = JSONDecoder()

if let deadpoolJsonData = deadpoolJson.data(using: .utf8) {
    

do {
    let deadpool = try jd.decode(Movie.self, from: deadpoolJsonData)
    deadpool.name
    deadpool.sales
} catch let e {
        print("error decoding json \(e)")
    }
}


let spiderMan = Movie(name: "Spiderman", sales: 319000000, rating: "PG-13", score: 4.5)

let je = JSONEncoder()

do {
    let data = try je.encode(spiderMan)
    let dataString = String(bytes: data, encoding: .utf8)
    print(dataString)
} catch let e {
    print("error enconding object \(e)")
}
