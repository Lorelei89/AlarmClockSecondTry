//
//  AlarmModel.swift
//  AlarmClockSecondTry
//
//  Created by Sabina Buruiana on 3/23/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation
import UIKit

class AlarmModel: NSObject {
    
    var id:Int = 0
    var hour: Int = 0
    var minutes: Int = 0
    var label: String = ""
    var enabled: Bool = false
    var token:String = ""
    var date:Date = Date()
    
    /* CONSTRUCTORS */

    init(id:Int,hour:Int, minutes:Int, label:String , enabled:Bool, token:String){
        super.init()
        self.id = id
        self.hour = hour
        self.label = label
        self.minutes = minutes
        self.enabled = enabled
        self.token = token
    }

    
}
