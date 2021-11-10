//
//  SettingsViewModel.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 10/11/2021.
//

import UIKit

class SettingsViewModel {
    
    public var settingsOptions = [
        SettingsOptions(title: "Profile", image: "person", handler: nil),
        SettingsOptions(title: "Account Management", image: "creditcard", handler: nil),
        SettingsOptions(title: "Referrals", image: "speaker", handler: nil),
        SettingsOptions(title: "Legal", image: "shield", handler: nil),
        SettingsOptions(title: "Help and Support", image: "square.and.pencil", handler: nil),
        SettingsOptions(title: "System", image: "iphone.homebutton", handler: nil),
        SettingsOptions(title: "Create Business Account",image: "arrow.triangle.2.circlepath", handler: nil),
        SettingsOptions(title: "Logout", image: "phone.arrow.right", handler: nil)
    ]
    
}
