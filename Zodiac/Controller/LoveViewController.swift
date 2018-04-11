//
//  LoveViewController.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/10.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import UIKit

class LoveViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sexSegment: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var houseSwitch: UISwitch!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "相亲神器"
    }
    
    @IBAction func didClickOnSureBtn(_ sender: Any) {
        
        let sex: String = sexSegment.titleForSegment(at: sexSegment.selectedSegmentIndex)!
        
        let calendar = NSCalendar.init(identifier: NSCalendar.Identifier.gregorian)
        let now = NSDate()
        let comments = calendar?.components(NSCalendar.Unit.year, from: datePicker.date, to: now as Date, options: NSCalendar.Options.init(rawValue: 0))
        let age = comments?.year
        
        let hourse = houseSwitch.isOn ? "有房" : "无房"
        
        textView.text = "\(nameTextField.text!), \(sex), \(age!)岁, \(heightLabel.text!), \(hourse), 求交往"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        let height = NSInteger(sender.value)
        heightLabel.text = "\(height)厘米"
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
