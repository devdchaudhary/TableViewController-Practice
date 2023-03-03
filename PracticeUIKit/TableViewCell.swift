//
//  TableViewCell.swift
//  PracticeUIKit
//
//  Created by devdchaudhary on 23/02/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableCellText: UILabel?
    @IBOutlet weak var button: UIButton?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func didTouchButton(_ sender: Any) {
        
        CustomNotificationCenter.postNotification("refreshTable", object: nil)

    }

    
    func loadCell(cellText: String) {
     
        tableCellText?.textColor = .black
        tableCellText?.text = cellText
        
    }
}
