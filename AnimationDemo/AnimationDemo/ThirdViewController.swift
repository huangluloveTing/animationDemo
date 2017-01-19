//
//  ThirdViewController.swift
//  AnimationDemo
//
//  Created by 黄露 on 2017/1/18.
//  Copyright © 2017年 黄露. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var subView_view: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var point = self.subLabel.center
        
        print("label : center : \(point.x , point.y)")
        
        print("label : center : \(self.subLabel.center.x , subLabel.center.y)")
        
        point = self.view.convert(point, from: self.subView_view)
        
        print("convert : center : \(point.x , point.y)")
        
        print("convert : center : \(self.view.center.x , self.view.center.y)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
