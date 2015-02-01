//
//  GraphView.swift
//  Grahph
//
//  Created by Minjiexie on 15/1/29.
//  Copyright (c) 2015年 MinjieXie. All rights reserved.
//

import UIKit

class GraphView: UIView {
    //Data 
    private var data = NSMutableArray()
    private var dataCount:Int!
    //Context
    private var context:CGContextRef?
    //Graph Size
    private var graphWidth:CGFloat = 0
    private var graphHeight:CGFloat = 0
    private var paddingTop:CGFloat = 30.0
    private var paddingLeft:CGFloat = 40.0
    private var axisWidth:CGFloat = 0
    private var axisHeight:CGFloat = 0
    //Graph Style
    var axisBackgroundColor:UIColor!
    var lowPoint:Int = 0
    var highPoint:Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(frame:CGRect,data:NSArray){
        super.init(frame:frame)
        backgroundColor = UIColor.whiteColor()
        self.data = data.mutableCopy() as NSMutableArray
    }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        //var dataArray:[String:String] = ["21":"Mon","32":"Tue","45":"Wed","76":"Thur","32":"Fri"]
        //Context
        context = UIGraphicsGetCurrentContext()
        // Graph Size
        graphWidth = rect.size.width - paddingTop
        graphHeight = rect.size.height - paddingLeft
        axisWidth = rect.size.width - 31.0
        axisHeight = rect.size.height - 31.0
        
        //Draw graph axis
        let axisPath = CGPathCreateMutable()
        CGPathMoveToPoint(axisPath, nil, paddingLeft,31.0)
        CGPathAddLineToPoint(axisPath,nil,paddingLeft,rect.size.height - 31.0)
        CGPathAddLineToPoint(axisPath,nil,axisWidth, rect.size.height - 31.0)
        CGContextAddPath(context,axisPath)
        CGContextSetStrokeColorWithColor(context,axisBackgroundColor.CGColor)
        CGContextStrokePath(context)
        
        // Draw X axis
        dataCount = data.count
        lowPoint = getLowPoint(data)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Define Y axis lowest point and highest point
    func getLowPoint(NSArray)->Int{
        
        var minNumber:Int = 0
        for index in 0...self.dataCount - 1{
            if(minNumber > data[index].objectForKey("value")?.integerValue){
                 println("TEST")
            }
        }
        return minNumber
    }
  /*  func getHighPoint(NSArray)->Int{
    }*/
}

