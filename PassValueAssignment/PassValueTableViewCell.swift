//
//  PassValueTableViewCell.swift
//  PassValueAssignment
//
//  Created by 潘立祥 on 2019/8/20.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class PassValueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var passValueLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton! {
        
        didSet {
            deleteButton.setTitle("delete", for: .normal)
            
            deleteButton.setTitleColor(.orange, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
