//
//  InfoViewController.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit



var indexForFlowerArray = 0
class InfoViewController: UIViewController {
    
    
    
    @IBOutlet weak var springTreesAndShrubsOutlet: UIButton!
    @IBOutlet weak var springFlowersAndCropPlantsOutlet: UIButton!
    @IBOutlet weak var summerTreesAndShrubsOutlet: UIButton!
    @IBOutlet weak var summerLowersAndCropPlantsOutlet: UIButton!
    @IBOutlet weak var fallTreesAndShrubsOutlet: UIButton!
    @IBOutlet weak var fallFlowersAndCropPlantsOutlet: UIButton!

    @IBOutlet weak var airQuality: UIButton!
    @IBOutlet weak var airPollution: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //darkgray?
        springTreesAndShrubsOutlet.applyDesing()
        springFlowersAndCropPlantsOutlet.applyDesing()
        summerTreesAndShrubsOutlet.applyDesing()
        summerLowersAndCropPlantsOutlet.applyDesing()
        fallTreesAndShrubsOutlet.applyDesing()
        fallFlowersAndCropPlantsOutlet.applyDesing()
        
        airQuality.applyDesing()
        airPollution.applyDesing()
    }
    
    @IBAction func springTreesAndShrubs(_ sender: UIButton) {
        indexForFlowerArray = 0
        self.performSegue(withIdentifier: "toTableView", sender: self)
    }
    
    
    
    @IBAction func springFlowersAndCropPlants(_ sender: UIButton) {
        indexForFlowerArray = 1
        self.performSegue(withIdentifier: "toTableView", sender: self)
    }
    
    @IBAction func summerTreesAndShrubs(_ sender: UIButton) {
        indexForFlowerArray = 2
        self.performSegue(withIdentifier: "toTableView", sender: self)
    }
    
    @IBAction func summerFlowersAndCropPlants(_ sender: UIButton) {
        indexForFlowerArray = 3
        self.performSegue(withIdentifier: "toTableView", sender: self)
    }
    
    
    @IBAction func fallTreesAndShrubs(_ sender: UIButton) {
        indexForFlowerArray = 4
        self.performSegue(withIdentifier: "toTableView", sender: self)
    }
    
    @IBAction func fallFlowersAndCropPlaants(_ sender: UIButton) {
        indexForFlowerArray = 5
        self.performSegue(withIdentifier: "toTableView", sender: self)
    }

}

extension UIButton {
    func applyDesing() {
        self.backgroundColor = UIColor.systemOrange
        self.layer.cornerRadius = frame.height / 2
        self.setTitleColor((UIColor.white), for: .normal)
        
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
