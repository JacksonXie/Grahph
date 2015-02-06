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
            ["label" : "Mon",   "value" : 15],
            ["label" : "Tues",  "value" : 30],
            ["label" : "Weds",  "value" :7],
            ["label" : "Thurs", "value" : 60],
            ["label" : "Fri",   "value" : 30],
            ["label" : "Sat",   "value" : 15],
            ["label" : "Sun",   "value" : 45],
            ] as NSArray
        graphView = GraphView(frame:CGRectMake(0,0,view.bounds.width,view.bounds.height*0.3),data:myData)
        graphView.backgroundColor = UIColor.blueColor()
        graphView.axisLineColor = UIColor.whiteColor()
        //Layout Set
        graphView.marginLeftAndRight = 40.0
        view.addSubview(graphView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

