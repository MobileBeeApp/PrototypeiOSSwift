//
//  SideMenuTableViewCell.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    static let identifier = "SideMenuTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SideMenuTableViewCell", bundle: nil)
    }
    
    public func configure(with title: String, imageName: String){
        myLabel.text = title
        myImageView.image = UIImage(systemName: imageName)
    }
    
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myLabel.font = .systemFont(ofSize: 15, weight: .bold)
        myImageView.contentMode = .scaleAspectFit
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
