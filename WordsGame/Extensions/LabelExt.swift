//
//  LabelExt.swift
//  WordsGame
//
//  Created by Arina on 21.05.2023.
//

import UIKit

extension UILabel {

    convenience init(nameOfLabel: String, height: CGFloat) {
        self.init()
        self.text = nameOfLabel
        self.font = UIFont.systemFont(ofSize: height)
        self.textColor = UIColor(named: "darkLilic")
    }
}
