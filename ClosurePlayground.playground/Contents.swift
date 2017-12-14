//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//Swift executes each line asyncronously and across multiple threads, so when executing lines of code that require more time the result could be returned before the process is complete, as will happen with URLSessions.  To force the compiler to take some time to execute a line we use a completion block so that we can access data only after it has been returned in the completion call.

func doSomethingWithNumbers(process: (Int, Int) -> (Int), report: (Int) -> ()) {
    let first = 18
    let second = 42
    let result = process(first, second)
    report(result)
}

//Example of multiple completions in one function.  Proccess is called with pointers to variables and then the result is reported and printed.
doSomethingWithNumbers(process: { (a, b) -> (Int) in
    return a * b
}) { (result) in
    print("\(result)")
}


PlaygroundPage.current.needsIndefiniteExecution = true
let url = URL(string: "https://www.apple.com")!

func getPageContents(url: URL, completion: @escaping (String) -> ()) {
    //If you have to use a URL header, etc, there can be a lot of variables that need to be passed.
    let task = URLSession(configuration: .ephemeral).dataTask(with: url) { (data, response, err) in
        completion(String(data: data!, encoding: .utf8)!)
    }
    task.resume()
}

var a: String = ""
//Call getPageContents with the url, then when the completion is called in getPageContents it is returned to the call as result, take the result from the completion and print it.
getPageContents(url: url) { (result) in
    a = result
//    print(a)
}


//Race Condtion - occurs on multithreaded code when two lines try to read or write at the same time and the computer doesn't know which process should be done first.
class Holder {
    var num: Int = 20
}

let holder = Holder()

DispatchQueue.main.async {
    holder.num = 42
}
DispatchQueue.global().async {
    holder.num = 63
}
//In the playground this prints out 63, but in the viewDidAppear of a project it prints out 42.  On the same computer with the same code it prints out two different results.
DispatchQueue.global().async {
    print("\(holder.num)")
}

//In xcode you can run a program with a different scheme to help debug problems like this.  Run -> Scheme -> Diagnostics -> Runtime Sanitization.  Running the above code with the ThreadSanitizer would point out the data race.  To fix this you could put all the accesses on the same thread so that it is not being accessed from multiple different threads.
