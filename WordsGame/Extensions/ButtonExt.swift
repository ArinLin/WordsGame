//
//  ButtonExt.swift
//  WordsGame
//
//  Created by Arina on 20.05.2023.
//

import UIKit

extension UIButton{
    convenience init(nameOfButton: String, background: UIColor) {
        self.init(type: .system)
        setTitle(nameOfButton, for: .normal)
        backgroundColor = background
        layer.cornerRadius = 12
        tintColor = UIColor(named: "paleColor")
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
