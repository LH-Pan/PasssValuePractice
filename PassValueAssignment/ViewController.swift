//
//  ViewController.swift
//  PassValueAssignment
//
//  Created by 潘立祥 on 2019/8/20.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var passValueTableView: UITableView!
    
    let defaultText: [String] = ["2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passValueTableView.delegate = self
        
        passValueTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "passValue") as? PassValueTableViewCell
            else {
                return UITableViewCell()
        }
        
        cell.passValueLabel.text = defaultText[indexPath.row]
        
        return cell
    }

}

