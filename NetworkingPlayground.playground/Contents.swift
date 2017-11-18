//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Message: Codable {
    var user: String?
    var text: String?
    var date: Date?
}

let message = Message(user: "russell", text: "this is a message of great import", date: Date())
print(message)

let data = try? JSONEncoder().encode(message)
print(String(data: data!, encoding: .utf8)!)

let message2 = try? JSONDecoder().decode(Message.self, from: data!)
print(message2!)

let url = URL(string: "https://obscure-crag-65480.herokuapp.com/list")

let task = URLSession(configuration: .ephemeral).dataTask(with: url!) { (data, response, error) in
    print(data!)
}
task.resume()

let postURL = URL(string: "https://obscure-crag-65480.herokuapp.com/new")
var request = URLRequest(url: postURL!)

request.addValue("tokenValue", forHTTPHeaderField: "token")
request.httpMethod = "POST"
request.httpBody = data

let postTask = URLSession(configuration: .ephemeral).dataTask(with: request) { (d, response, error) in
    print("complete post")
}
postTask.resume()

let uuid = UUID()
print(uuid.uuidString)
