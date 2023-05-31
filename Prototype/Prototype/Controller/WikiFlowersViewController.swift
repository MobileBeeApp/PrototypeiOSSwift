//
//  WikiFlowersViewController.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit

var globalStringForNow = ""

class WikiFlowersViewController: UIViewController {

    var flowers:[[FlowerTableModel]] = [[
        //Spring: Trees and shrubs
        FlowerTableModel(body: "Almond"),
        FlowerTableModel(body: "American Chestnut"),
        FlowerTableModel(body: "American Elm"),
        FlowerTableModel(body: "American Hazel"),
        FlowerTableModel(body: "American holly"),
        FlowerTableModel(body: "American mountain ash"),
        FlowerTableModel(body: "American Sycamore"),
        FlowerTableModel(body: "Apple"),
        FlowerTableModel(body: "Basket Willow"),
        FlowerTableModel(body: "Black Cherry"),
        FlowerTableModel(body: "Black Locust"),
        FlowerTableModel(body: "Blackberry"),
        FlowerTableModel(body: "Blackthorn"),
        FlowerTableModel(body: "Cherry Plum"),
        FlowerTableModel(body: "Common Hackberry"),
        FlowerTableModel(body: "Crab Apple"),
        FlowerTableModel(body: "Europea field elm"),
        FlowerTableModel(body: "Flowering Quince"),
        FlowerTableModel(body: "Goat Willow"),
        FlowerTableModel(body: "Grey Alder"),
        FlowerTableModel(body: "Hawthorn"),
        FlowerTableModel(body: "Honey Locust"),
        FlowerTableModel(body: "Manitoba Maple"),
        FlowerTableModel(body: "Maple"),
        FlowerTableModel(body: "Norway maple"),
        FlowerTableModel(body: "Oak"),
        FlowerTableModel(body: "Peach"),
        FlowerTableModel(body: "Pear"),
        FlowerTableModel(body: "Plum"),
        FlowerTableModel(body: "Pussy Willow"),
        FlowerTableModel(body: "Raspberry"),
        FlowerTableModel(body: "Red Maple"),
        FlowerTableModel(body: "Silky leaf osier"),
        FlowerTableModel(body: "Sour Cherry"),
        FlowerTableModel(body: "Sweet Chestnut"),
        FlowerTableModel(body: "Tulip-tree"),
        FlowerTableModel(body: "Violet Willow"),
        FlowerTableModel(body: "Walnut"),
        FlowerTableModel(body: "White Ash"),
        FlowerTableModel(body: "White Willow"),
        FlowerTableModel(body: "Wild Cherry"),
        FlowerTableModel(body: "Willow")
        ],
    //Spring: Flowers and crop plants
    [FlowerTableModel(body: "Ajuga"),
     FlowerTableModel(body: "Asparagus"),
     FlowerTableModel(body: "Canola"),
     FlowerTableModel(body: "Chick weed"),
     FlowerTableModel(body: "Chives"),
     FlowerTableModel(body: "Common Mallow"),
     FlowerTableModel(body: "Dandelion"),
     FlowerTableModel(body: "Gorse"),
     FlowerTableModel(body: "Henbit"),
     FlowerTableModel(body: "Leopard's Bane"),
     FlowerTableModel(body: "Mustard"),
     FlowerTableModel(body: "Sainfoin"),
     FlowerTableModel(body: "Siberian squill"),
     FlowerTableModel(body: "Snowdrop"),
     FlowerTableModel(body: "White mustard"),
     FlowerTableModel(body: "White Sweet Clover"),
     FlowerTableModel(body: "Winter aconite"),
     FlowerTableModel(body: "Yellow Crocus"),
     FlowerTableModel(body: "Yellow Sweet Clover")
    ],
    //Summer: Trees and shrubs
    [FlowerTableModel(body: "Basswood"),
     FlowerTableModel(body: "Bluebeard"),
     FlowerTableModel(body: "Blueberry"),
     FlowerTableModel(body: "Boston Ivy 'Veitchii'"),
     FlowerTableModel(body: "Elder"),
     FlowerTableModel(body: "Horse chestnut"),
     FlowerTableModel(body: "Northern Catalpa"),
     FlowerTableModel(body: "Red Horse chestnut"),
     FlowerTableModel(body: "Southern Catalpa"),
     FlowerTableModel(body: "Sumac"),
     FlowerTableModel(body: "Virginia creeper")
    ],
    //Summer: Flowers and crop plants
    [FlowerTableModel(body: "Alfalfa"),
     FlowerTableModel(body: "Allium"),
     FlowerTableModel(body: "Alsike Clover"),
     FlowerTableModel(body: "Alyssum"),
     FlowerTableModel(body: "Aster"),
     FlowerTableModel(body: "Basil"),
     FlowerTableModel(body: "Blue Thistle"),
     FlowerTableModel(body: "Blue vine"),
     FlowerTableModel(body: "Borage"),
     FlowerTableModel(body: "Buckwheat"),
     FlowerTableModel(body: "Cat-tail"),
     FlowerTableModel(body: "Chicory"),
     FlowerTableModel(body: "Chives"),
     FlowerTableModel(body: "Clover"),
     FlowerTableModel(body: "Common Chickweed"),
     FlowerTableModel(body: "Common vetch"),
     FlowerTableModel(body: "Cotoneaster"),
     FlowerTableModel(body: "Crimson Clover"),
     FlowerTableModel(body: "Cucumber"),
     FlowerTableModel(body: "Fireweed"),
     FlowerTableModel(body: "Garlic chives"),
     FlowerTableModel(body: "Germander"),
     FlowerTableModel(body: "Heather"),
     FlowerTableModel(body: "Hemp"),
     FlowerTableModel(body: "Jewelweed"),
     FlowerTableModel(body: "Joe-Pye weed"),
     FlowerTableModel(body: "Knapweed"),
     FlowerTableModel(body: "Land-in-blue"),
     FlowerTableModel(body: "Leadwort syn. Indigobush"),
     FlowerTableModel(body: "Lupin"),
     FlowerTableModel(body: "Mallow"),
     FlowerTableModel(body: "Marigold"),
     FlowerTableModel(body: "Melons"),
     FlowerTableModel(body: "Onion"),
     FlowerTableModel(body: "Opium Poppy"),
     FlowerTableModel(body: "Phacelia"),
     FlowerTableModel(body: "Poppy"),
     FlowerTableModel(body: "Pumpkin"),
     FlowerTableModel(body: "Smartweed"),
     FlowerTableModel(body: "Spring Vetch"),
     FlowerTableModel(body: "Star thistle"),
     FlowerTableModel(body: "Sunflower"),
     FlowerTableModel(body: "Sweet Corn"),
     FlowerTableModel(body: "White Clover"),
     FlowerTableModel(body: "White Sweet Clover"),
     FlowerTableModel(body: "Yellow Sweet Clover")
    ],
    //Fall: Trees and shrubs
    [FlowerTableModel(body: "Chinese Elm"),
    ],
    //Fall: Flowers and crop plants
    [FlowerTableModel(body: "Aster"),
     FlowerTableModel(body: "Borage"),
     FlowerTableModel(body: "Goldenrod"),
     FlowerTableModel(body: "Ivy"),
     FlowerTableModel(body: "Melons"),
     FlowerTableModel(body: "Pumpkin"),
     FlowerTableModel(body: "Sweet autumn clematis")
    ]
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}


extension WikiFlowersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flowers[indexForFlowerArray].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellForFlowers, for: indexPath)
        cell.textLabel?.text = flowers[indexForFlowerArray][indexPath.row].body
        return cell
    }
    
    
}

extension WikiFlowersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(flowers[indexForFlowerArray][indexPath.row].body)
        globalStringForNow = flowers[indexForFlowerArray][indexPath.row].body
        performSegue(withIdentifier: "ListOfFlowersToWikiPage", sender: self)
    }
}
