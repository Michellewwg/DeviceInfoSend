//
//  ChecklistItem.swift
//  DeviceInfoSend
//
//  Created by Michelle Rutherford on 11/19/15.
//  Copyright © 2015 Michelle Rutherford. All rights reserved.
//

import Foundation
class ChecklistItem {
    var text = ""
    var checked = false
    func toggleChecked() {
        checked = !checked
    }
}

