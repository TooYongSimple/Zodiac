//
//  DateToString.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/11.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import Foundation


func dateToString (date: NSDate) -> String {
    
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "YYYY-MM-dd"
    let customDate = dateformatter.string(from: date as Date)
    return customDate
}

func stringToDate (str: String) -> NSDate {
    
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "YYYY-MM-dd"
    return dateformatter.date(from: str)! as NSDate
    
}
