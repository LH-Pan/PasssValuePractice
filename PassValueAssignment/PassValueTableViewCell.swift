//
//  PassValueTableViewCell.swift
//  PassValueAssignment
//
//  Created by 潘立祥 on 2019/8/20.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

    // Delegate Protocol
//protocol PassValueTableViewCellDelegate: AnyObject {
//
//    func removeData(_ cell: PassValueTableViewCell)
//}

class PassValueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var passValueLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton! {
        
        didSet {
            deleteButton.setTitle("delete", for: .normal)
            
            deleteButton.setTitleColor(.orange, for: .normal)
        }
    }
    
//    weak var delegate: PassValueTableViewCellDelegate?
     
    var removeDataClosure: (() -> ())!
        
    @IBAction func removeData(_ sender: Any) {
        
        // MARK: Delegate
//        delegate?.removeData(self)
    
        // MARK: Closure
        removeDataClosure()
    }
}
