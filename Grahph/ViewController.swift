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
        let myData = [
            ["label" : "Mon",   "value" : NSNumber(int:15)],
            ["label" : "Tues",  "value" : NSNumber(int:30)],
            ["label" : "Weds",  "value" : NSNumber(int:7)],
            ["label" : "Thurs", "value" : NSNumber(int:60)],
            ["label" : "Fri",   "value" : NSNumber(int:30)],
            ["label" : "Sat",   "value" : NSNumber(int:15)],
            ["label" : "Sun",   "value" : NSNumber(int:45)],
            ]()
        graphView = GraphView(frame:CGRectMake(20,200,300,200),data:myData)
        graphView.backgroundColor = UIColor.blueColor()
        graphView.axisBackgroundColor = UIColor.whiteColor()
        view.addSubview(graphView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

