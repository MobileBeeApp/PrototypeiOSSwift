//
//  MessageCell.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit

class MessageCell: UITableViewCell {

    
    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var labelView: UILabel!

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageView.layer.cornerRadius = messageView.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
