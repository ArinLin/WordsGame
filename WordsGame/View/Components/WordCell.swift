//
//  WordCell.swift
//  WordsGame
//
//  Created by Arina on 27.05.2023.
//

import UIKit

class WordCell: UITableViewCell {
    // Создаем идентификатор и называем его как ячейку (станартная практика)
    static let reuseID = "WordCell"
    
    let wordLabel = UILabel()
    let scoreLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    // Устанавливаем констрейнты, но здесь они будут уже не относительно большой вьюхе, а относительно ячейки
    func setConstraints() {
        let stack = UIStackView(arrangedSubviews: [wordLabel, scoreLabel])
        stack.axis = .horizontal
        stack.spacing = 8

        addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
//        wordLabel.font = UIFont.systemFont(ofSize: 18)
        wordLabel.font = .boldSystemFont(ofSize: 20)
//        scoreLabel.font = UIFont.systemFont(ofSize: 18)
        scoreLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
