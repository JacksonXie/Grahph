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
        graphView = GraphView()
        graphView.backgroundColor = UIColor.blueColor()
        graphView.frame = CGRectMake(20,200,300,200)
        graphView.axisBackgroundColor = UIColor.whiteColor()
        view.addSubview(graphView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

