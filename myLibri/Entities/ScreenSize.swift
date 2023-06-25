//
//  ScreenSize.swift
//  myLibri
//
//  Created by Daniil Konashenko on 02.05.2023.
//

import UIKit

class ScreenSize {
    private static var instance: ScreenSize?
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    static func shared() -> ScreenSize {
        if instance == nil {
            instance = ScreenSize()
        }
        return instance!
    }
    
}
