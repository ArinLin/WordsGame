//
//  GameView.swift
//  WordsGame
//
//  Created by Arina on 20.05.2023.
//

import UIKit

class GameView: UIView {
    
    let imageBackground = UIImageView(image: UIImage(named: "bg"))
    let exitButton = UIButton()
    let bigWordLabel = UILabel()
    let firstPlayerLabel = UILabel(nameOfLabel: "Ваня", height: 24)
    let firstPlayerScore = UILabel(nameOfLabel: "26", height: 48)
    let secondPlayerLabel = UILabel(nameOfLabel: "Арина", height: 24)
    let secondPlayerScore = UILabel(nameOfLabel: "24", height: 48)
    let madeWordTextField = UITextField(placeholder: "Введите ваше слово")
    let readyButton = UIButton(nameOfButton: "Готово", background: UIColor(named: "darkPurple") ?? .black)
    let tableScore = UITableView()
    
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    //Внешний вид элементов интерфейса
    func setViews() {
        imageBackground.contentMode = .scaleAspectFill
        // Устанавливаем SF Symbol на кнопку
        exitButton.setImage(UIImage(systemName: "arrowshape.backward"), for: .normal)
        // Увеличиваем SF Symbol в размерах
        exitButton.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        // Меняем цвет SF Symbol
        exitButton.tintColor = UIColor(named: "darkPurple")
        
        bigWordLabel.text = "Магнитотерапия"
        bigWordLabel.font = UIFont.boldSystemFont(ofSize: 35)
        bigWordLabel.textColor = UIColor(named: "darkPurple")
        
        madeWordTextField.textAlignment = .center
        
        tableScore.backgroundColor = .clear
        tableScore.separatorColor = UIColor(named: "darkPurple")
        tableScore.backgroundView = nil
        // Регистрируем ячейку WordCell в таблице
        tableScore.register(WordCell.self, forCellReuseIdentifier: WordCell.reuseID)
    }
    
    //Расположение на экране элементов (геометрия)
    func setConstraints() {
        addSubview(imageBackground)
        addSubview(exitButton)
        addSubview(bigWordLabel)
        
        let firstPlayerStack = UIStackView(arrangedSubviews: [firstPlayerScore, firstPlayerLabel])
        firstPlayerStack.axis = .vertical
        firstPlayerStack.alignment = .center
        firstPlayerStack.spacing = 0
        firstPlayerStack.backgroundColor = UIColor(named: "firstBGColor")
        firstPlayerStack.layer.cornerRadius = 12
        
        let secondPlayerStack = UIStackView(arrangedSubviews: [secondPlayerScore, secondPlayerLabel])
        secondPlayerStack.axis = .vertical
        secondPlayerStack.alignment = .center
        secondPlayerStack.spacing = 0
        secondPlayerStack.backgroundColor = UIColor(named: "secondPlayerBGColor")
        secondPlayerStack.layer.cornerRadius = 12
        
        let playersStack = UIStackView(arrangedSubviews: [firstPlayerStack, secondPlayerStack])
        playersStack.axis = .horizontal
        playersStack.spacing = 12
//        addSubview(playersStack)
        
        //доб
        let allStack = UIStackView(arrangedSubviews: [playersStack, madeWordTextField, readyButton, tableScore])
        allStack.axis = .vertical
        allStack.spacing = 28
        addSubview(allStack)
        
//        addSubview(madeWordTextField)
//        addSubview(readyButton)
//        addSubview(tableScore)
        
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        bigWordLabel.translatesAutoresizingMaskIntoConstraints = false
        playersStack.translatesAutoresizingMaskIntoConstraints = false
        madeWordTextField.translatesAutoresizingMaskIntoConstraints = false
        readyButton.translatesAutoresizingMaskIntoConstraints = false
        tableScore.translatesAutoresizingMaskIntoConstraints = false
        
        allStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: topAnchor),
            imageBackground.leftAnchor.constraint(equalTo: leftAnchor),
            imageBackground.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageBackground.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            exitButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            exitButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            exitButton.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            bigWordLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 25),
            bigWordLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        //чтобы стеки равномерно заполнялись и были, например, квадратными, делаем настройки контстрейнтами:
        NSLayoutConstraint.activate([
            firstPlayerStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
            secondPlayerStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
            firstPlayerStack.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            secondPlayerStack.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35)
        ])
        
        NSLayoutConstraint.activate([
            firstPlayerScore.heightAnchor.constraint(equalTo: firstPlayerStack.heightAnchor, multiplier: 0.5),
            secondPlayerScore.heightAnchor.constraint(equalTo: secondPlayerStack.heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            playersStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            playersStack.topAnchor.constraint(equalTo: bigWordLabel.bottomAnchor, constant: 30),
        ])
        
//        NSLayoutConstraint.activate([
//            madeWordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
//            madeWordTextField.topAnchor.constraint(equalTo: playersStack.bottomAnchor, constant: 30),
//            madeWordTextField.leftAnchor.constraint(equalTo: playersStack.leftAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            readyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            readyButton.topAnchor.constraint(equalTo: madeWordTextField.bottomAnchor, constant: 30),
//            readyButton.leftAnchor.constraint(equalTo: playersStack.leftAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            tableScore.centerXAnchor.constraint(equalTo: centerXAnchor),
//            tableScore.topAnchor.constraint(equalTo: readyButton.bottomAnchor, constant: 30),
//            tableScore.leftAnchor.constraint(equalTo: playersStack.leftAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            allStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            allStack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//чтобы отображался превью провайдер как в SwiftUI
import SwiftUI

struct GameViewProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewRepresentable {
        let myView = GameView()
        
        
        func makeUIView (context: Context) -> some UIView {
            return myView
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
