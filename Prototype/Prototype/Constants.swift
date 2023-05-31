//
//  Constants.swift
//  Prototype
//
//  Created by Eugen Puzynin on 29.01.21.
//

struct Constants {
    static let loginSegue =
        "ViewControllerToLoginView"
    static let chatSegue = "ViewControllerToChat"
    static let imageViewSegue = "ViewControllerToCameraView"
    static let infoViewSegue = "ViewControllerToInfoView"
    static let apiFutureValues = "ViewControllerToAPIManagerPredictions"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let cellForFlowers = "TableViewCellForFlowers"
    
    struct Firestore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
