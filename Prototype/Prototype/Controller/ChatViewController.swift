//
//  ChatViewController.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    
    //array of messages
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        loadMessages()
    }
    
    //loads the messages from firestore
    func loadMessages() {
        db.collection(Constants.Firestore.collectionName).order(by: Constants.Firestore.dateField).addSnapshotListener { (querySnapshot, error) in
            
            self.messages = []
            
            
            if let e = error {
                print("issue retrieving data from firestore, \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[Constants.Firestore.senderField] as? String, let messageBody = data[Constants.Firestore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            //update the view on tableview
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                //scrolls messages
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        //save message to firestore
        //message and current user
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(Constants.Firestore.collectionName).addDocument(data: [
                //what things are stored
                Constants.Firestore.senderField: messageSender,
                Constants.Firestore.bodyField: messageBody,
                Constants.Firestore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("Issue saving data to firestore, \(e)")
                } else {
                    print("Successfully saved data.")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
        
    }
    
}


extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //here fatal error when i click on chat and no one is logged in
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.labelView.text = message.body
        
        //message from the current user
        if message.sender == Auth.auth().currentUser?.email {
            cell.messageView.backgroundColor = UIColor.systemGreen

//            messageTextfield.textAlignment = .center
        }
        //message from another sender
        else {
            cell.messageView.backgroundColor = UIColor.systemGray
        }

        return cell
    }
    
    
}
