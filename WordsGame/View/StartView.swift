//
//  StartView.swift
//  WordsGame
//
//  Created by Arina on 20.05.2023.
//

import UIKit

class StartView: UIView {
    
    let imageBG = UIImageView(image: UIImage(named: "bg"))
    let gameName = UILabel()
    var enteredWord = UITextField(placeholder: "Введите слово")
    var player1 = UITextField(placeholder: "Первый игрок")
    var player2 = UITextField(placeholder: "Второй игрок")
    let startButton = UIButton(nameOfButton: "Начать", background: UIColor(named: "darkPurple") ?? .white)
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .blue
        setViews()
        setConstraints()
    }
    
    //Внешний вид элементов интерфейса
    func setViews() {
        imageBG.contentMode = .scaleAspectFill
        gameName.text = "Words Game"
        gameName.font = .boldSystemFont(ofSize: 42)
        gameName.textColor = UIColor(named: "darkPurple")
        enteredWord.textAlignment = .center
        player1.textAlignment = .center
        player2.textAlignment = .center
    }
    
    //Расположение на экране элементов (геометрия)
    func setConstraints() {
        addSubview(imageBG)
        addSubview(gameName)
        
        let playersStack = UIStackView(arrangedSubviews: [player1, player2])
        playersStack.axis = .vertical
        playersStack.spacing = 18
        
        let elementsStack = UIStackView(arrangedSubviews: [enteredWord, playersStack, startButton])
        elementsStack.axis = .vertical
        elementsStack.spacing = 30
        addSubview(elementsStack)
        
        
        imageBG.translatesAutoresizingMaskIntoConstraints = false
        gameName.translatesAutoresizingMaskIntoConstraints = false
        elementsStack.translatesAutoresizingMaskIntoConstraints = false //выключается сразу у всех элементов этого стека
        
        
        NSLayoutConstraint.activate([
            imageBG.topAnchor.constraint(equalTo: topAnchor),
            imageBG.leftAnchor.constraint(equalTo: leftAnchor),
            imageBG.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageBG.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            elementsStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            elementsStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            elementsStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 55)
        ])
        
        NSLayoutConstraint.activate([
            gameName.bottomAnchor.constraint(equalTo: elementsStack.topAnchor, constant: -40),
            gameName.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



//чтобы отображался превью провайдер как в SwiftUI
import SwiftUI

struct StartViewProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewRepresentable {
        let myView = StartView()
        
        
        func makeUIView (context: Context) -> some UIView {
            return myView
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
