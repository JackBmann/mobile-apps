//
//  NetworkingService.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/9/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import Foundation

class NetworkingService {
    
    struct Token: Codable {
        let token: String
    }
    
    struct User: Codable {
        let name: String
        let password: String
    }
    
    struct Message: Codable {
        var user: String?
        var text: String?
        var date: Date?
        var imgURL: URL?
        var id: String?
        var replyTo: String?
        var likedBy: [String]?
    }
    
    static var shared = NetworkingService()
    
    let urlText = "https://obscure-crag-65480.herokuapp.com/"
    var token: Token
    var user: User
    
    init() {
        token = Token(token: "initialized token")
        user = User(name: "default", password: "default")
    }
    
    func login(username: String, password: String, completion:@escaping (String) -> ()) {
        if self.token.token != "initialized token" {
            completion(self.token.token)
        }
        
        self.user = User(name: username, password: password)
        let loginURL =  URL(string: urlText + "login")!
        var loginRequest = URLRequest(url: loginURL)
        loginRequest.httpBody = try? JSONEncoder().encode(self.user)
        loginRequest.addValue("token", forHTTPHeaderField: "token")
        loginRequest.httpMethod = "POST"
        
        let loginTask = URLSession(configuration: .ephemeral).dataTask(with: loginRequest) { (data, response, error) in
            self.token = try! JSONDecoder().decode(Token.self, from: data!)
            completion(self.token.token)
        }
        loginTask.resume()
    }
    
    func getUsers(completion:@escaping ([String]) -> ()) {
        let getUsersURL =  URL(string: urlText + "users")!
        var getUsersRequest = URLRequest(url: getUsersURL)
        getUsersRequest.addValue(self.token.token, forHTTPHeaderField: "token")
        getUsersRequest.httpMethod = "GET"
        
        let task = URLSession(configuration: .ephemeral).dataTask(with: getUsersRequest) { (data, response, error) in
            completion(try! JSONDecoder().decode([String].self, from: data!))
        }
        task.resume()
    }
    
    func getMessages(completion:@escaping ([Message]) -> ()) {
        let getMessagesURL =  URL(string: urlText + "messages")!
        var getMessagesRequest = URLRequest(url: getMessagesURL)
        getMessagesRequest.addValue(self.token.token, forHTTPHeaderField: "token")
        getMessagesRequest.httpMethod = "GET"
        
        let task = URLSession(configuration: .ephemeral).dataTask(with: getMessagesRequest) { (data, response, error) in
            completion(try! JSONDecoder().decode([Message].self, from: data!))
        }
        task.resume()
    }
    
    func postMessage(message: Message, completion:@escaping (Bool) -> ()) {
        let postMessageURL =  URL(string: urlText + "messages")!
        var postMessageRequest = URLRequest(url: postMessageURL)
        postMessageRequest.httpBody = try? JSONEncoder().encode(message)
        postMessageRequest.addValue(self.token.token, forHTTPHeaderField: "token")
        postMessageRequest.httpMethod = "POST"
        
        let task = URLSession(configuration: .ephemeral).dataTask(with: postMessageRequest) { (data, response, error) in
            print(data!, response!)
            completion(String(data: data!, encoding: .utf8) == "[\"success\"]")
        }
        task.resume()
    }
    
    func likeMessage(likeId: [String: String], completion:@escaping () -> ()) {
        let likeMessageURL =  URL(string: urlText + "like")!
        var likeMessageRequest = URLRequest(url: likeMessageURL)
        likeMessageRequest.httpBody = try? JSONEncoder().encode(likeId)
        likeMessageRequest.addValue(self.token.token, forHTTPHeaderField: "token")
        likeMessageRequest.httpMethod = "POST"
        
        let task = URLSession(configuration: .ephemeral).dataTask(with: likeMessageRequest) { (data, response, error) in
            completion()
        }
        task.resume()
    }

}
