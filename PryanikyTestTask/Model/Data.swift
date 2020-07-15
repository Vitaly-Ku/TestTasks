//
//  Data.swift
//  PryanikyTestTask
//
//  Created by Vit K on 14.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

struct Data: Codable {
    var data: [Datum]
    let view: [String]
}

struct Datum: Codable {
    var name: String
    let data: DataClass
}

struct DataClass: Codable {
    let text: String?
    var url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Codable {
    let id: Int
    let text: String
}
