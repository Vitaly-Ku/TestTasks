//
//  Extension.swift
//  HalfPieCharts
//
//  Created by Vit K on 06.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    static let backgroundColor = UIColor.rgb(r: 21, g: 22, b: 33)
    static let outlineStrokeColor = UIColor.rgb(r: 80, g: 200, b:70)
    static let trackStrokeColor = UIColor.rgb(r: 85, g: 106, b: 73)
    static let pulsatingFillColor = UIColor.rgb(r: 128, g: 160, b: 120)
}
