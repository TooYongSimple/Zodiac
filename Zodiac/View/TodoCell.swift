
//
//  TodoCell.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/11.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var head: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    
    var model: TodoModel {

        self.head.image = UIImage.init(named: self.model.image)
        self.name.text = self.model.title
        let time = dateToString(date: self.model.date)
        self.time.text = time
        return self.model
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
