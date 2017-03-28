//
//  FixNestedTableViewCell.swift
//  Nested TableView Accessibility Test
//
//  Created by Yung Dai on 2017-03-27.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class FixNestedTableViewCell: UITableViewCell {

    @IBOutlet weak var accessibilityView: UIView!
    @IBOutlet weak var subTableView: UITableView!
    @IBOutlet weak var tableNumberLabel: UILabel!
    
    var labelArray: [String]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // initial setup code
        setupTableView()
    }
    
   
    
    func setupTableView() {

        // override the accessibility elements
        //self.accessibilityView.accessibilityElements = [self.subTableView]

    }
}


extension FixNestedTableViewCell: UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}


extension FixNestedTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let data = labelArray else { return 0 }
        
        return data.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NestedTableViewCell", for: indexPath) as! NestedTableViewCell
        
        guard let text = labelArray?[indexPath.row] as String! else  {
            
            cell.cellLabel.text = "No Text"
            return cell
        }
        
        cell.cellLabel.text = text


        return cell
    }
    
}



