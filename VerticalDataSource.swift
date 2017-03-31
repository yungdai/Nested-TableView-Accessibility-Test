//
//  VerticalDataSource.swift
//  Nested TableView Accessibility Test
//
//  Created by Yung Dai on 2017-03-30.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class VerticalDataSource: NSObject  {
    
    var items: [String]?
    var tableViewCellIdentifier: String?
    
    
    convenience init(items: [String]) {
        self.init()
        
        self.items = items
    }

    
    override init() {
        super.init()
        
    
        
    }

}

extension VerticalDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension VerticalDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = items?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier!, for: indexPath) as! NestedTableViewCell
        
        guard let text = items?[indexPath.row] as String! else  {
            
            cell.cellLabel.text = "No Text"
            return cell
        }
        
        cell.cellLabel.text = text
        
        
        return cell
    }
    
    
    // automatic dimensioning of the cell
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 30
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
}
