//
//  ViewController.swift
//  Prime Number02
//
//  Created by dit08 on 2019. 4. 11..
//  Copyright © 2019년 dit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    
    
    @IBAction func checkBtn(_ sender: Any) {
        if let num = Int(myTextField.text!){
            var isPrime = true
            
            if num <= 0 {
                myLabel.text = "input correct value!"
                myTextField.text = ""
                return
            }
            
            if num == 1 {
                isPrime = false
            }
            
            if num != 1 && num != 2{
                for i in 2 ..< num{
                    if num % i == 0 {
                        isPrime = false
                    }
                }
            }
            if isPrime == false {
                myLabel.text = "소수가 아니다"
            }
            else {
                myLabel.text = "소수다"
            }
            myTextField.text = ""
        }
        else{
            print("nil발생")
            myLabel.text = "숫자가 아니거나 공백입니다."
            myTextField.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        myTextField.placeholder = "ex) 7"
        myTextField.clearButtonMode = UITextField.ViewMode.always
        view.backgroundColor = UIColor.lightGray
    }
    
    //background view를 누르면 키패드가 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // return 키를 누르면 키패드가 내려감
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return true
    }

}

