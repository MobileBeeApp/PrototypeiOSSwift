//
//  SideMenu.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import Foundation
import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable {
    case standardMapView = "Street Map"
    case mapView2D = "Satellite Map"
    case mapView3D = "Flyover Map"
    case directions = "Directions"
    case chat = "Chat"
    case profile = "Profile"
    case stockkarte = "Beekeeper Journal"
    case info = "Info"
}



class MenuController: UITableViewController {

    
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [SideMenuItem]
    private let imageMenuItems = [ "map",
                                   "view.2d",
                                   "view.3d",
                                   "car",
                                   "message",
                                   "person.crop.circle",
                                   "menubar.dock.rectangle",
                                   "info.circle"
    ]
    //custom initialiser
    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SideMenuTableViewCell.nib(), forCellReuseIdentifier: SideMenuTableViewCell.identifier)
        tableView.backgroundColor = .secondarySystemBackground
        tableView.separatorStyle = .none
        view.backgroundColor = .secondarySystemBackground
            
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let customCell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath) as! SideMenuTableViewCell

//        customCell.configure(with: menuItems[indexPath.row].rawValue, imageName: "gear")
        //be careful with imagemenuitems array, can overflow
        customCell.configure(with: menuItems[indexPath.row].rawValue, imageName: imageMenuItems[indexPath.row])
//        cell.textLabel?.text = menuItems[indexPath.row].rawValue
////        cell.textLabel?.textColor = .white
        customCell.backgroundColor = .secondarySystemBackground
        customCell.contentView.backgroundColor = .secondarySystemBackground
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //close menu and show different controller
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}
