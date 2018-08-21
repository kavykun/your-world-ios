//
//  MenuViewController.swift
//  YourWorld
//
//  Created by Asad on 8/19/18.
//  Copyright © 2018 Joey Rattana. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    let title_arr = ["MAP" , "PROFILE" , "INVENTORY" , "CHALLENGES" , "SHOP" , "SPCIAL" , "ACHIEVEMENTS" , "SETTINGS"]
    @IBOutlet weak var menu_tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menu_tableView.delegate = self
        menu_tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as! MenuTableViewCell
        
        cell.label_title.text = title_arr[indexPath.row]
        return cell
    }

}
