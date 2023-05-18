//
//  StructScreenSize.swift
//  myLibri
//
//  Created by Daniil Konashenko on 02.05.2023.
//

import UIKit

struct StructScreenSize {
    static let shared = StructScreenSize()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
}
