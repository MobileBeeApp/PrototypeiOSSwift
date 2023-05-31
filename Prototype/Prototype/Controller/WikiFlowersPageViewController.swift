//
//  WikiFlowersPageViewController.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
class WikiFlowersPageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelText: UITextView!
    
    let wikipediaURL = "https://en.wikipedia.org/w/api.php?action=query&list=search&srwhat=text&srsearch=Barberton+daisy&format=json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.requestInfoFromWikipedia(flowerName: "Gerbera jamesonii")
        if bffText != "" {
            self.requestInfoFromWikipedia(flowerName: bffText)
            bffText = ""
        } else {
        self.requestInfoFromWikipedia(flowerName: globalStringForNow)
        }
    }
        func requestInfoFromWikipedia(flowerName: String){



            let parameters : [String:String] = [

                "format:" : "json",
                "action" : "query",
                "prop" : "extracts|pageimages",
                "exintro" : "",
                "explaintext" : "",
                "titles" : flowerName,
                "indexpageids" : "",
                "redirects" : "1",
                "pithumbsize" : "500"

            ]

            AF.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success(let value):

            let flowerJSON: JSON = JSON(value)

            let pageid = flowerJSON["query"]["pageids"][0].stringValue

            let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue

            let flowerImageURL = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                
                
            self.imageView.sd_setImage(with: URL(string: flowerImageURL))
            

//            self.label.text = flowerDescription
                self.labelText.text = flowerDescription
            case .failure:
            print("did not get the wikipedia info")
            }
            }

        }

    }
    


