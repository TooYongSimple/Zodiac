//
//  TodoModel.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/11.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    
    var id: String
    var image: String
    var title: String
    var date: NSDate

    init (id: String,image: String, title: String,date:NSDate) {
        
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
/*
 结构体会把对象存储到栈中，如果model想要将对象进行回传的话会出现问题
 而类只是一个指针
 结构体每次都会将对象进行一次复制
 */
struct TodoModel1 {
    var id: String
    var image: String
    var title: String
    var date: NSDate
}
