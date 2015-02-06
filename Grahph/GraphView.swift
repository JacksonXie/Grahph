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
    //Context Layout
    private var context:CGContextRef?
    //Graph Size
    private var graphWidth:CGFloat = 0
    private var graphHeight:CGFloat = 0
    private var paddingTop:CGFloat = 30.0
    //Graph Style
    var axisBackgroundColor:UIColor!
    var lowPoint:Int = 0
    var highPoint:Int = 0
    var labelFont = UIFont.systemFontOfSize(12)
    var labelColor = UIColor.whiteColor()
    private var labelMargetTop:CGFloat = 15.0
    //Layout
    var marginLeftAndRight:CGFloat = 0
    //Axis Style
    var axisLineColor:UIColor!
    //Trigger Line
    var TriggerLineWidth:CGFloat = 0
    var TriggerLineHeight:CGFloat = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(frame:CGRect,data:NSArray){
        super.init(frame:frame)
        backgroundColor = UIColor.whiteColor()
        self.data = data.mutableCopy() as NSMutableArray
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        var context:CGContextRef
        drawBackground(rect)
        for i in 0...data.count-1{
            drawTriggerLine(rect,index:i)
        }
    }
    //The function draw the background
    func drawBackground(rect:CGRect){
        // Graph Size
        context = UIGraphicsGetCurrentContext()
        graphWidth = rect.size.width - paddingTop
        graphHeight = rect.size.height - marginLeftAndRight
        // Axis line
        drawAxis(rect,lineColor:axisLineColor.CGColor)
        // Axis Label
        let xLabel = drawLabel("0")
        xLabel.frame = CGRectMake(marginLeftAndRight, graphHeight+labelMargetTop, 10, 10)
        addSubview(xLabel)
        
    }
    //Drawing Triggr Line
    func drawTriggerLine(rect:CGRect,index:Int){
        let triggerLine = CGPathCreateMutable()
        CGPathMoveToPoint(triggerLine,nil,marginLeftAndRight+CGFloat(index*20),graphHeight-20.0)
        CGPathAddLineToPoint(triggerLine,nil,marginLeftAndRight+CGFloat(index*20), graphHeight)
        CGContextAddPath(context, triggerLine)
        CGContextSetStrokeColorWithColor(context,UIColor.redColor().CGColor)
        CGContextStrokePath(context)
    }
    func drawAxis(rect:CGRect,lineColor:CGColorRef){
        context = UIGraphicsGetCurrentContext()
        let axisPath = CGPathCreateMutable()
        CGPathMoveToPoint(axisPath,nil, marginLeftAndRight,graphHeight)
        CGPathAddLineToPoint(axisPath,nil,graphWidth, graphHeight)
        CGContextAddPath(context, axisPath)
        CGContextSetStrokeColorWithColor(context,lineColor)
        CGContextStrokePath(context)
    }
    func drawLabel(title:NSString)->UILabel{
        let label = UILabel(frame: CGRectZero)
        label.text = title
        label.font = labelFont
        label.textColor = labelColor
        label.textAlignment = NSTextAlignment.Center
        label.sizeToFit()
        return label
    }
    // locate the trigger on timeline
    // return Int to describe the percentage
    func locatetheTrigger(index:Int)->Int{
        var percentage:Int = 0
        var timePoint:Int = 0
        timePoint = (data[index].objectForKey("value") as NSNumber).integerValue
        percentage = timePoint % 24
        return percentage
    }
}


