//
//  Extensions.swift
//  AlarmClockSecondTry
//
//  Created by Sabina Buruiana on 3/23/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation

extension String {
    func convertDate() -> String {
        let formater = DateFormatter()
        formater.dateFormat = TimeFormat.serverFormat
        let convertedDate = formater.date(from: self)
        formater.dateFormat = TimeFormat.displayFormat
        let stringDate = formater.string(from: convertedDate!)
        return stringDate
    }
    
}
