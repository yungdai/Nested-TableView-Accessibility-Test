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
    @IBOutlet weak var nestedTableView: UITableView!
    @IBOutlet weak var tableNumberLabel: UILabel!
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        nestedTableView.register(NestedTableViewCell.classForCoder(), forCellReuseIdentifier: "NoFixedNestedTableViewCell")
//    }

    func setTableNumberLabelText(text: String) {
        
        self.tableNumberLabel.text = text
        
    }

}







