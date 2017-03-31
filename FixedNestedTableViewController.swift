//
//  FixedNestedTableViewController.swift
//  Nested TableView Accessibility Test
//
//  Created by Yung Dai on 2017-03-27.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class FixedNestedTableViewController: UITableViewController {

    
    lazy var dataArray: [String] = {
        
        self.setUpdataArray(name: "Nested Cell Elements", count: 5)
    }()
    
    var nestedDataSource = VerticalDataSource()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixedNestedTableViewCell", for: indexPath) as! FixNestedTableViewCell

        // cell setup
        cell.setTableNumberLabelText(text: "Nested Table: \(indexPath.row + 1)")

        // delegate the datasource and delegate function to the nestedDataSource NSObject that Jacky told me to create
        nestedDataSource.items = dataArray
        nestedDataSource.tableViewCellIdentifier = "NestedTableViewCell"
        cell.nestedTableView.dataSource = nestedDataSource
        cell.nestedTableView.delegate = nestedDataSource
        cell.nestedTableView.reloadData()
        cell.nestedTableView.rowHeight = UITableViewAutomaticDimension
        
        // auto dimension the tableView
        tableView.contentSize.height = UITableViewAutomaticDimension
        
        
        /* This is the key to the getting nested collections working in Accessibility
         you must build an accessibility elements array for all the major elements in the cell into the accessibilityView.
         
         You MUST put in the whole tableView as an accessibility element in order for the nested collections to be ready out by voiceover.
         
         This will also work with nesting another collection type such UICollectionView.
         */
        
        cell.accessibilityView.accessibilityElements = [cell.tableNumberLabel, cell.nestedTableView]

        return cell
    }
    
    
    private func setUpdataArray(name: String, count: Int) -> [String] {
       
        var array = [String]()
        
        for index in 1...count {
            
            let cellString = "\(name): \(index)"
            array.append(cellString)
        }
        
        return array
    }
    
    
    // automatic dimensioning of the cell
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 400
    }

}
