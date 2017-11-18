//
//  MessagesViewController.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/14/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {
    
    var messages: [NetworkingService.Message] = []
    
    @IBAction func composeButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let messagesViewController = storyboard.instantiateViewController(withIdentifier: "composeMessageViewController") as! ComposeMessageViewController
        self.present(messagesViewController, animated: true, completion: nil)
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        NetworkingService.shared.getMessages() { messages in
            DispatchQueue.main.async {
                self.messages = messages
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.getMessages() { messages in
            DispatchQueue.main.async {
                self.messages = messages
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueway" {
            guard let destination = segue.destination as? MessageInfoViewController else { return }
            guard let source = sender as? MessagesCell else { return }
            destination.message = source.message
        }
    }
    
}

extension MessagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesCell", for: indexPath) as! MessagesCell
        cell.configure(message)
        cell.message = message
        return cell
    }
    
}
