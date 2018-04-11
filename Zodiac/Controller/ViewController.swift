//
//  ViewController.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/10.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import UIKit


enum NSDateAstrologyChineseZodiacSign:NSInteger {
    
    case NSDateAstrologyChineseZodiacSignRat = 0                   // 鼠(子)
    case NSDateAstrologyChineseZodiacSignOx                        // 牛(丑)
    case NSDateAstrologyChineseZodiacSignTiger                     // 虎(寅)
    case NSDateAstrologyChineseZodiacSignRabbit                    // 兔(卯)
    case NSDateAstrologyChineseZodiacSignDragon                    // 龙(辰)
    case NSDateAstrologyChineseZodiacSignSnake                     // 蛇(巳)
    case NSDateAstrologyChineseZodiacSignHorse                     // 马(午)
    case NSDateAstrologyChineseZodiacSignGoat                      // 羊(未)
    case NSDateAstrologyChineseZodiacSignMonkey                    // 猴(申)
    case NSDateAstrologyChineseZodiacSignRooster                   // 鸡(酉)
    case NSDateAstrologyChineseZodiacSignDog                       // 狗(戌)
    case NSDateAstrologyChineseZodiacSignPig                       // 猪(亥)
}

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "十二生肖"
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }

    @IBAction func didClickOnSureBtn(_ sender: UIButton) {
        
        textField.resignFirstResponder()
        if let year = NSInteger(textField.text!) {
        
            let imagenumber = (year - 4) % 12
            imageView.image = UIImage.init(named: String(imagenumber))
        }
        
    }

}

