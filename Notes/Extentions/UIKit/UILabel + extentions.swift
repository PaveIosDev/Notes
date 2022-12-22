//
//  UILabel + extentions.swift
//  Notes
//
//  Created by Павел Яковенко on 21.12.2022.
//

import UIKit

extension UILabel {
//    convenience init(text: String = "") {
//        self.init()
//        self.text = text
//        self.font = .robotoMedium14()
//        self.textColor = #colorLiteral(red: 0.7098039216, green: 0.6901960784, blue: 0.6196078431, alpha: 1)
//        self.adjustsFontSizeToFitWidth = true
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
    
    convenience init(text: String = "", font: UIFont?, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
