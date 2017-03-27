//
//  NoFixTableViewCell.swift
//  Nested TableView Accessibility Test
//
//  Created by Yung Dai on 2017-03-27.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class NoFixTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var subTableView: UITableView!
    
    
    var labelArray: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // initial setup code
        // setupTableView()
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        // not implimented
    }
    
    func setTableNumberLabelText(text: String) {
        
        self.tableNumberLabel.text = text
        
    }
    
    
    func setupTableView() {
        

        // extra setup coode here later
    }
    
}


extension NoFixTableViewCell: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}


extension NoFixTableViewCell: UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let data = labelArray else { return 0 }
   
        return data.count
  
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "NoFixedNestedTableViewCell", for: indexPath) as! NestedTableViewCell
        
        guard let text = labelArray?[indexPath.row] as String! else  {
            
            cell.cellLabel.text = "No Text"
            return cell
        }
        
        cell.cellLabel.text! = text
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
}
