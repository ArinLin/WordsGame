//
//  ViewController.swift
//  WordsGame
//
//  Created by Arina on 20.05.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    let mainView = StartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        addActions()
    }

    func addActions() {
        
        let startTap = UIAction { _ in
            guard let word = self.mainView.enteredWord.text,
                  var NameFirstPlayer = self.mainView.player1.text, //делаем переменной, потому что при второй проверке, мы меняем значение
                  var NameSecondPlayer = self.mainView.player2.text
            else { return }
            // Добавляем проверки
            //1. Первое слово должно состоять минимум из 8 символов
            guard word.count >= 8 else {
                //1. Cоздаем алерт
                let alert = UIAlertController(title: "Слово слишком короткое!", message: "Введите слово длинее 7 букв", preferredStyle: .alert)
                //2. Создаем кнопки для алерта
                let okAlertButton = UIAlertAction(title: "OK", style: .default)
                //3. Добавляем кнопки на алерт
                alert.addAction(okAlertButton)
                //4. Показываем алерт пользователю
                self.present(alert, animated: true)
                
                return
            }
            
            //2. Если не заданы имена игроков, то игроков зовут "Игрок 1" и "Игрок 2"
            if NameFirstPlayer == "" {
                NameFirstPlayer = "Игрок 1"
            }
            if NameSecondPlayer == "" {
                NameSecondPlayer = "Игрок 2"
            }
            
            //наследуем из класса
            let firstPlayer = Player(name: NameFirstPlayer)
            let secondPlayer = Player(name: NameSecondPlayer)
            
            //добавляем GameViewController на главный контроллер
            let gameVC = GameViewController(firstPlayer1: firstPlayer, secondPlayer2: secondPlayer, bigWord: word)
            
            //чтобы вьюконтроллер был во весь экран, а не показывался как sheet
            gameVC.modalPresentationStyle = .fullScreen
            
            //чтобы заданное слово после нажатия на выход автоматически исчезало и его не нужно было отчищать вручную
            self.mainView.enteredWord.text?.removeAll()
            
            //чтобы заданное имя игроков после нажатия на выход автоматически исчезало и его не нужно было очищать вручную
            self.mainView.player1.text?.removeAll()
            self.mainView.player2.text?.removeAll()
            
            //показываем вьюконтроллер
            self.present(gameVC, animated: true)
        }
        mainView.startButton.addAction(startTap, for: .touchUpInside)
    }
    
    
}

