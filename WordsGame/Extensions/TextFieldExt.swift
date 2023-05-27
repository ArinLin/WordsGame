//
//  TextFieldExt.swift
//  WordsGame
//
//  Created by Arina on 20.05.2023.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        backgroundColor = UIColor(named: "textColor")?.withAlphaComponent(0.9)
        layer.cornerRadius = 12
        // для того, чтобы плейсхолдер был больше
        heightAnchor.constraint(equalToConstant: 45).isActive = true
        // для того, чтобы слова не прилипали к краю
//        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
//        leftViewMode = .always
    }
}
