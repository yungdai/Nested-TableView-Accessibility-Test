//
//  NoFixTableViewController.swift
//  Nested TableView Accessibility Test
//
//  Created by Yung Dai on 2017-03-27.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class NoFixTableViewController: UITableViewController {

    
    lazy var dataArray: [String] = {
        
        self.setUpdataArray(name: "Nested Cell Elements", count: 5)
    }()
    
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noFixTableCell", for: indexPath) as! NoFixTableViewCell
        // cell setup
        cell.labelArray = dataArray
        cell.setTableNumberLabelText(text: "Nested Table: \(indexPath.row + 1)")
        cell.nestedTableView.rowHeight = UITableViewAutomaticDimension
        cell.nestedTableView.reloadData()
        
        // auto dimension the tableView
        tableView.contentSize.height = UITableViewAutomaticDimension
        return cell
    }
    
    func setUpdataArray(name: String, count: Int) -> [String] {
        
        var array = [String]()
        
        for index in 1...count {
            
            let cellString = "\(name): \(index)"
            array.append(cellString)
        }
        
        return array
        
    }
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 400
    }
    
    
    // need to fix the autodimensioning
    /*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }*/

}
