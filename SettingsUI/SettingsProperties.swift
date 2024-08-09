//
//  SettingsOptions.swift
//  SettingsUI
//
//  Created by gokul v on 21/04/24.
//

import Foundation
import UIKit

struct Section {
    let title: String
    let options: [SettingSwitchType]
}

enum SettingSwitchType {
    case staticCell(model: SettingsOptions)
    case switchCell(model: SettingSwitchOption)
}

struct SettingSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var isOn: Bool
}

struct SettingsOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}
