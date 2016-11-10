//
//  TryDrawRect.swift
//  LetsSwift
//
//  Created by Kutung-PC48 on 09/11/16.
//  Copyright © 2016 Muthukumaresh. All rights reserved.
//

import UIKit

class TryDrawRect: UIView {
    var countFuncCall:Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
       self.countFuncCall += 1
        
        print(countFuncCall)
       
        
        self.backgroundColor = UIColor.blueColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
      //   self.backgroundColor = UIColor.blueColor()
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 4.0)
        CGContextSetStrokeColorWithColor(context,
                                         UIColor.blueColor().CGColor)
        let rectangle = CGRectMake(60,170,200,80)
        CGContextAddRect(context, rectangle)
        CGContextStrokePath(context)
        CGContextSetFillColorWithColor(context,
                                       UIColor.redColor().CGColor)
        CGContextFillRect(context, rectangle)
        
    }
 

}
