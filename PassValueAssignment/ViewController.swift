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
    
    let nextVC = NextViewController()
    
    var index: IndexPath?
    
    var defaultText: [String] = ["2", "3", "4", "5"] {
        
        didSet {
            
            passValueTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passValueTableView.delegate = self
        
        passValueTableView.dataSource = self
        
//        nextVC.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "passValue") as? PassValueTableViewCell
            else {
                return UITableViewCell()
        }
//        cell.delegate = self
        
        cell.passValueLabel.text = defaultText[indexPath.row]
        
        cell.deleteButton.tag = indexPath.row
        
        cell.removeDataClosure = { 
            
            self.defaultText.remove(at: indexPath.row)
            
            tableView.reloadData()
        }
        
        // Target - Action
//        cell.deleteButton.addTarget(self, action: #selector(removeCell(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    // Target - Action @objc func
//    @objc func removeCell(sender: UIButton) {
//
//        defaultText.remove(at: sender.tag)
//
//        passValueTableView.reloadData()
//    }

    @IBAction func addText(_ sender: Any) {
        
        nextVC.myTextField.text = ""
        
        index = nil
        
        nextVC.passTextClosure = { myText in
            
            self.defaultText.append(myText)
        }
        
        show(nextVC, sender: sender)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        nextVC.myTextField.text = defaultText[indexPath.row]
        
        index = indexPath
        
        nextVC.passTextClosure = { myText in
            
            self.defaultText[self.index!.row] = myText
        }
        
        show(nextVC, sender: indexPath)
    }
}

    // Delegate
//extension ViewController: PassValueTableViewCellDelegate {
//
//    func removeData(_ cell: PassValueTableViewCell) {
//
//        guard let indexPath = passValueTableView.indexPath(for: cell) else { return }
//
//        defaultText.remove(at: indexPath.row)
//
//        passValueTableView.reloadData()
//
//    }
//}

//extension ViewController: GetTextDelegate {
//
//    func getText(didGet text: String) {
//
//        guard let index = index else { return }
//
//        defaultText[index.row] = text
//    }
//
//    func addText(didEdit text: String) {
//
//        if index == nil {
//
//            defaultText.append(text)
//        }
//    }
//}
