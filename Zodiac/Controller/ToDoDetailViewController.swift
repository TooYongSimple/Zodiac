//
//  ToDoDetailViewController.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/11.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import UIKit

 
class ToDoDetailViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var backView: UIStackView!
    
    @IBOutlet weak var childBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var cardBtn: UIButton!
    @IBOutlet weak var travelBtn: UIButton!
    
    
    var model: TodoModel?
    var image: String = ""
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if model != nil {
        
            todoTextField.text = model?.title
            datePicker!.setDate(model?.date as! Date, animated: true)
            if model?.id == "0" {
                self.didClickOnToDoBtn(childBtn)
            }
            else if model?.id == "1" {
                self.didClickOnToDoBtn(phoneBtn)
            }
            else if model?.id == "2" {
                self.didClickOnToDoBtn(cardBtn)
            }
            else if model?.id == "3" {
                self.didClickOnToDoBtn(travelBtn)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func didClickOnToDoBtn(_ sender: UIButton) {
        
        for obj in backView.subviews {
            
            if obj .isKind(of: UIButton.classForCoder()) {
                let btn: UIButton = obj as! UIButton
                btn.isSelected = false
            }
        }
        
        sender.isSelected = !sender.isSelected
        
        index = sender.tag
        if sender.isSelected {
            switch sender.tag{
            case 0: do {
                
                image = "child-selected"
            }
            case 1: do {
           
                image = "phone-selected"
            }
            case 2: do {
                
                image = "shopping-cart-selected"
            }
            case 3: do {
                
                image = "travel-selected"
            }
            default: break
            }
        }
    }
    
    @IBAction func didClickOnSureBtn(_ sender: UIButton) {
        
        if model != nil {
            
            model?.image = image
            model?.title = todoTextField.text!
            model?.date = datePicker.date as NSDate
        }
        else {
            if image != "" && title != "" {
                let model = TodoModel.init(id: String(index), image: image, title: self.todoTextField.text!, date: datePicker.date as NSDate)
                dataArr.append(model)
            }
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        todoTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        todoTextField.resignFirstResponder()
        return true
    }
}
