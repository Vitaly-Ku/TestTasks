//
//  StatCareTaker.swift
//  Millionaire
//
//  Created by Vit K on 31.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

class StatCareTaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "statistics"
    
    func save(statics: [Statistic]) {
        do {
            let data = try encoder.encode(statics)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [Statistic] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try decoder.decode([Statistic].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
