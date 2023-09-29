//
//  Item.swift
//  Thod
//
//  Created by Ashtyn Morel-Blake on 9/24/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
