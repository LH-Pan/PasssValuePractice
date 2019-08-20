//
//  NextViewController.swift
//  PassValueAssignment
//
//  Created by 潘立祥 on 2019/8/20.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    var textField: UITextField = UITextField()
    
    var button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(textField)
        view.addSubview(button)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 2/3),
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 2/3),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 20)
            ])
        
        setupTextField()
        
        setupButton()
    }
    
    func setupTextField() {

        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = .orange
//        textField.delegate = self as? UITextFieldDelegate
    }
    
    func setupButton() {
        
        button.layer.cornerRadius = 20
        button.backgroundColor = .black
        button.setTitle("Button", for: .normal)
    }
}
