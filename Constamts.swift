//
//  Constamts.swift
//  AlarmClockSecondTry
//
//  Created by Sabina Buruiana on 3/23/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//


import Foundation
import UIKit

public struct AlarmCell {
    static var reuseIdentifier = "AlarmCell"
    static let nibName = "AlarmTableViewCell"
}

public struct TimeFormat {
    static let serverFormat = "yyyy-MM-dd'T'HH:mm:ss"
    static let displayFormat = "HH:mm"
}


public let apiUrlEndPoint = " http://red.maxcode.net/api/clocks"
public let firstTabBarButton = "Alarm"
public let secondTabBarButton = "Timer"
public let barColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1.0)


