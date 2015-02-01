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
    private var paddingY:CGFloat = 0
    //Graph Style
    var axisBackgroundColor:UIColor!
    var lowPoint:Int = 0
    var highPoint:Int = 0
    var labelFont = UIFont.systemFontOfSize(12)
    var labelColor = UIColor.blackColor()
    
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
        
        // Draw Y axis
        dataCount = data.count
        lowPoint = getLowPoint(data)
        highPoint = getHighPoint(data)
        paddingY = CGFloat((highPoint - lowPoint)%(dataCount+1))
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Define Y axis lowest point and highest point
    func getLowPoint(NSArray)->Int{
        var minNumber:Int = (data[0].objectForKey("value") as NSNumber).integerValue
        for index in 1...self.dataCount - 1{
            if(minNumber > (data[index].objectForKey("value") as NSNumber).integerValue){
               minNumber  = (data[index].objectForKey("value") as NSNumber).integerValue
            }
        }
        if(minNumber-10>=0){
            minNumber = minNumber - 10
        }
        return minNumber
    }
    func getHighPoint(NSArray)->Int{
        var maxNumber:Int = (data[0].objectForKey("value") as NSNumber).integerValue
        for index in 1...self.dataCount - 1{
            if(maxNumber < (data[index].objectForKey("value") as NSNumber).integerValue){
                maxNumber  = (data[index].objectForKey("value") as NSNumber).integerValue
            }
        }
        return maxNumber+10
    }
    //axis Label 
    func axisLabel(title:NSString)->UILabel{
        var label = UILabel(frame: CGRectZero)
        label.text = title
        label.font = labelFont
        label.textColor = labelColor
        label.backgroundColor = backgroundColor
        label.textAlignment = NSTextAlignment.Center
        return label
    }
}

