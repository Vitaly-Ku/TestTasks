//
//  Singleton.swift
//  HalfPieCharts
//
//  Created by Vit K on 10.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

class Storage {
    private init() {}
    
    public static let shared = Storage()
    
    var gender: String = ""
    var age: String = ""
    var weigh: String = ""
    var height: String = ""
    var phone: String = ""
    
}
