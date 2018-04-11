//
//  DetailViewController.swift
//  Zodiac
//
//  Created by zhangjianyun on 2018/4/10.
//  Copyright © 2018年 com.taihejiacheng. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage.init(named: name)
    }

    @IBAction func share(_ sender: UIBarButtonItem) {
        
        let vc = SLComposeViewController.init(forServiceType: SLServiceTypeSinaWeibo)
        vc?.setInitialText("一起来玩女神画廊app吧!")
        vc?.add(imageView.image)
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
