//
//  ViewController.swift
//  EvenOdd
//
//  Created by DCS on 14/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myTextFiled:UITextField={
        let textField = UITextField()
        textField.placeholder="Enter Any Number"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Check", for: .normal)
        button.addTarget(self, action: #selector(checkEvenOdd), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()

    @objc private func checkEvenOdd(){
        print("Check")
        
        guard let num   = Int(myTextFiled.text!) else{
            let alert = UIAlertController(title: "Oops!", message: "Worng input , Please Enter Number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert,animated: true,completion: nil)
            }
            return
        }
        let vc =  ResultVCViewController()
        
        if num % 2 == 0{
            vc.result = "Even Number"
        }else{
            vc.result = "Odd Number"
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        view.addSubview(myTextFiled)
        view.addSubview(myButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTextFiled.frame = CGRect(x: 40, y: (view.frame.height/2) - 50, width: view.frame.width - 80, height: 60)
        myButton.frame = CGRect(x: 40, y: (view.frame.height/2) + 50 , width: view.frame.width - 80, height: 60)
        
//        myTextFiled.frame = CGRect(x: 40, y: (view.height/2) - 50 ,width: view.width - 80, height: 60)
    }

}

