//
//  NextViewController.swift
//  PassValueAssignment
//
//  Created by 潘立祥 on 2019/8/20.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    let textField: UITextField = UITextField()
    
    let button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(textField)
        
        view.addSubview(button)
        
        setupTextField()
        
        setupButton()
        
        setupConstrain()
        
        setupNavigationBar()
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
        
        button.addTarget(self, action: #selector(backView), for: .touchUpInside)
        
    }
    
    func setupNavigationBar() {
    
        let navLeftButton = UIBarButtonItem(barButtonSystemItem: .reply,
                                            target: self,
                                            action: #selector(backView))
        
        navigationItem.leftBarButtonItem = navLeftButton
    }
    
    func setupConstrain() {
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            textField.widthAnchor.constraint(equalTo: textField.superview!.widthAnchor,
                                             multiplier: 2/3),
            
            textField.centerXAnchor.constraint(equalTo: textField.superview!.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: textField.superview!.safeAreaLayoutGuide.topAnchor,
                                           constant: 100),
            
            button.heightAnchor.constraint(equalToConstant: 40),
            
            button.widthAnchor.constraint(equalTo: button.superview!.widthAnchor,
                                          multiplier: 2/3),
            
            button.centerXAnchor.constraint(equalTo: button.superview!.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: button.superview!.centerYAnchor,
                                        constant: 20)
        ])
    }
    
    @objc func backView() {
        
        self.navigationController?.popViewController(animated: true)
    }
}

