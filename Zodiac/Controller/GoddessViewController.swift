//
//  GoddessViewController.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/10.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import UIKit

class GoddessViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    let dataArr = ["范冰冰","李冰冰","王菲","杨幂","周迅"]
    let imageData = ["fangbingbing","libingbing","wangfei","yangmi","zhouxun"]
    var _row: NSInteger = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "女神画廊"
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        _row = row
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickOnSureBtn(_ sender: UIButton) {
        
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "goDetail" {
            
            let vc = segue.destination as! DetailViewController
            vc.title = dataArr[_row]
            vc.name = imageData[_row]
        }
    }

}
