//
//  ViewController.swift
//  Grahph
//
//  Created by Minjiexie on 15/1/29.
//  Copyright (c) 2015年 MinjieXie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var graphView:GraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.frame = CGRectMake(100,100,200,100)
        view.addSubview(graphView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

