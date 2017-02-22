//
//  MemoTableViewController.swift
//  MemoApp
//
//  Created by Period 2 on 2/3/17.
//  Copyright © 2017 Period 2. All rights reserved.
//

import Foundation
import UIKit

class MemoTableViewController : UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath)
        
        // 4
        cell.textLabel?.text = "Yay - it's working!"
        
        // 5
        return cell
    }
}

