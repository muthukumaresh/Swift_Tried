//
//  muCustomTry.swift
//  LetsSwift
//
//  Created by Kutung-PC48 on 03/11/16.
//  Copyright © 2016 Muthukumaresh. All rights reserved.
//

import Foundation
import UIKit

class muCustomTry {
    
    var tryName:String = ""
    var tryPopulation:String = ""
    
 required init(tryName:String,tryPopulation:String){
        self.tryName = tryName
        self.tryPopulation = tryPopulation
    }
    
    
    func getData(tryName:String,tryPopulation:String) -> Void {
        self.tryName = tryName
        self.tryPopulation = tryPopulation
        
    }
    
    
}
