//
//  NextViewController.swift
//  PassValueAssignment
//
//  Created by 潘立祥 on 2019/8/20.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    weak var delegate: GetTextDelegate?
    
    let myTextField: UITextField = UITextField()
    
    let myButton: UIButton = UIButton()
    
    var passTextClosure: ((String)->())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(myTextField)
        
        view.addSubview(myButton)
        
        setupTextField()
        
        setupButton()
        
        setupConstrain()
        
        setupNavigationBar()
    }
    
    func setupTextField() {

        myTextField.font = UIFont.systemFont(ofSize: 16)
        
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        myTextField.backgroundColor = .orange
    }
    
    func setupButton() {
        
        myButton.layer.cornerRadius = 20
        
        myButton.backgroundColor = .black
        
        myButton.setTitle("Button", for: .normal)
        
        myButton.addTarget(self, action: #selector(backView), for: .touchUpInside)
    }
    
    func setupNavigationBar() {
    
        let navLeftButton = UIBarButtonItem(barButtonSystemItem: .reply,
                                            target: self,
                                            action: #selector(backView))
        
        navigationItem.leftBarButtonItem = navLeftButton
    }
    
    func setupConstrain() {
        
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            myTextField.heightAnchor.constraint(equalToConstant: 40),
            
            myTextField.widthAnchor.constraint(equalTo: myTextField.superview!.widthAnchor,
                                             multiplier: 2/3),
            
            myTextField.centerXAnchor.constraint(equalTo: myTextField.superview!.centerXAnchor),
            
            myTextField.topAnchor.constraint(equalTo: myTextField.superview!.safeAreaLayoutGuide.topAnchor,
                                           constant: 100),
            
            myButton.heightAnchor.constraint(equalToConstant: 40),
            
            myButton.widthAnchor.constraint(equalTo: myButton.superview!.widthAnchor,
                                          multiplier: 2/3),
            
            myButton.centerXAnchor.constraint(equalTo: myButton.superview!.centerXAnchor),
            
            myButton.topAnchor.constraint(equalTo: myButton.superview!.centerYAnchor,
                                        constant: 20)
        ])
    }
    
    @objc func backView() {
        
        guard let myText = myTextField.text else { return }
        
        delegate?.getText(didGet: myText)
        
        delegate?.addText(didEdit: myText)
        
        passTextClosure(myText)
        
        self.navigationController?.popViewController(animated: true)
    }
}

protocol GetTextDelegate: AnyObject {
    
    func getText(didGet text: String)
    
    func addText(didEdit text: String)
}


