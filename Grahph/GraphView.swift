//
//  GraphView.swift
//  Grahph
//
//  Created by Minjiexie on 15/1/29.
//  Copyright (c) 2015年 MinjieXie. All rights reserved.
//

import UIKit

class GraphView: UIView {
    //Context
    private var context:CGContextRef?
    //Graph Size
    private var graphWidth:CGFloat!
    private var graphHeight:CGFloat!
    private var paddingTop:CGFloat = 30.0
    private var paddingLeft:CGFloat = 40.0
    private var axisWidth:CGFloat!
    private var axisHeight:CGFloat!
    
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        //Context
        context = UIGraphicsGetCurrentContext()
        // Graph Size
        graphWidth = rect.size.width - paddingTop
        graphHeight = rect.size.height - paddingLeft
        axisWidth = rect.size.width
        axisHeight = rect.size.height
        
        //Draw graph axis
        let axisPath = CGPathCreateMutable()
        CGPathMoveToPoint(axisPath, nil, paddingLeft, 0)
        CGPathAddLineToPoint(axisPath,nil, 20, 0)
        CGContextAddPath(context,axisPath)
        CGContextSetStrokeColorWithColor(context,UIColor.blackColor().CGColor)
        CGContextStrokePath(context)
    }
}

