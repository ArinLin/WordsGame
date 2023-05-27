//
//  GameViewController.swift
//  WordsGame
//
//  Created by Arina on 20.05.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    let mainView = GameView()
    
    let firstPlayer1: Player
    let secondPlayer2: Player
    let bigWord: String
    
    // Учстанавливаем очередность игроков
    var isFirst: Bool = true
    
    // Массив слов, которые уже были составлены
    var words: [String] = []
    
    init(firstPlayer1: Player, secondPlayer2: Player, bigWord: String) {
        self.firstPlayer1 = firstPlayer1
        self.secondPlayer2 = secondPlayer2
        self.bigWord = bigWord
        super .init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setupUI()
        ButtonActions()
        mainView.tableScore.dataSource = self
    }
    
    // Устанавливаем интерфейс 
    func setupUI() {
        mainView.bigWordLabel.text = bigWord // отображение большого слова на вьюхе
        // передаем имена на гейм вью
        mainView.firstPlayerLabel.text = firstPlayer1.name
        mainView.secondPlayerLabel.text = secondPlayer2.name
        // передаем баллы на гейм вью
        mainView.firstPlayerScore.text = "0"
        mainView.secondPlayerScore.text = "0"
    }
    
    // Обновляем интерфейс
    func updateUI() {
        mainView.firstPlayerScore.text = "\(firstPlayer1.score)"
        mainView.secondPlayerScore.text = "\(secondPlayer2.score)"
        // Добавляем метод, чтобы составленное слово стиралось в текст филде автоматически
        mainView.madeWordTextField.text?.removeAll()
        // Таблица сама по себе не обновляет данные, для того, чтобы обновляла делаем:
        mainView.tableScore.reloadData()
    }
    
    func ButtonActions() {
        let exitTap = UIAction { _ in
            // Завершение игры
            let exitAlert = UIAlertController(title: "", message: "Вы уверены, что хотите завершить игру?", preferredStyle: .actionSheet)
            //2. Создаем кнопки для алерта
            let yesAlertButton = UIAlertAction(title: "ДА", style: .destructive) { _ in
                self.dismiss(animated: true) // Исчезновение экрана
            }
            let noAlertButton = UIAlertAction(title: "НЕТ", style: .cancel)
            //3. Добавляем кнопки на алерт
            exitAlert.addAction(yesAlertButton)
            exitAlert.addAction(noAlertButton)
            //4. Показываем алерт пользователю
            self.present(exitAlert, animated: true)
        }
        // добавляем экшен на кнопку выхода
        mainView.exitButton.addAction(exitTap, for: .touchUpInside)
        
        let readyTap = UIAction { _ in
            guard let word = self.mainView.madeWordTextField.text else { return }
            //1. Cоставленное слово не должно быть короче 2 букв
            //TODO: Кнопка не должна срабатывать, если слово короче 2 букв
            if word.count > 1 {
                self.mainView.readyButton.isEnabled
            }
            
            //2. Слово не должно быть исходным
            guard word.lowercased() != self.bigWord.lowercased() else { return }
            
            //3. Слово не должно быть составлено ранее
            guard !self.words.contains(word.lowercased()) else { return }
            
            //4. Cлово должно составляться из букв исходного
            let currentScore = self.checkWord()
            guard currentScore > 0 else { return }
            
            // Засчитываем игроку баллы за слово по очереди
            switch self.isFirst{
            case true:
                self.firstPlayer1.addScore(count: currentScore)
            case false:
                self.secondPlayer2.addScore(count: currentScore)
            }
            
            // Переключаем игрока
            self.isFirst.toggle()
            
            //Обновляем интерфейс (уже заданной функцией выше)
            self.updateUI()
        }
        // добавляем экшен на кнопку ready
        mainView.readyButton.addAction(readyTap, for: .touchUpInside)
    }

    // Метод для проверки введенного слова
    func checkWord() -> Int {
        var bigChars = makeChars(word: bigWord.lowercased())
        var littleWord = mainView.madeWordTextField.text!.lowercased()
        var littleChars = makeChars(word: littleWord)
        var sum = 0
        for char in littleChars {
            guard bigChars.contains(char) else { return 0 }
            if let index = bigChars.firstIndex(of: char) {
                bigChars.remove(at: index)
            }
            sum += 1
        }
        words.append(littleWord)
        return sum
    }
    
    // Метод, который преобразует введенное слово в массив символов
    func makeChars(word: String) -> [Character] {
        var chars = [Character]()
        for char in word {
            chars.append(char)
        }
        return chars
    }

}

// Для того, чтобы заполнить таблицу данными, мы подписываем контроллер под протокол UITableViewDataSource

extension GameViewController: UITableViewDataSource {

    // Обязательный метод, возвращает количество ячеек в секции таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ячеек в таблице будет столько же, сколько и составленных слов, поэтому возвращаем words.count
        words.count
    }

    // Обязательный метод, который создает, заполняет и возвращает ячейку по конкретному пути индекса
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath.row - номер ячейки в секции
        // indexPath.section - номер секции
        
        // создаем ячейку (чтобы пользоваться свойствами wordLabel и scoreLabel нашей конкретной созданной WordCell, необходимо привести к WordCell)
        let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.reuseID) as! WordCell
        // заполняем данными
        //1. Достаем слово
        let word = words[indexPath.row]
        //2. Заполняем данными
        cell.wordLabel.text = word
        cell.scoreLabel.text = "\(word.count)"
        
        // Устанавливаем цвет текста
        cell.scoreLabel.textColor = UIColor(named: "darkPurple")
        cell.wordLabel.textColor = UIColor(named: "darkPurple")
    
        // Установка прозрачного фона ячейки
        cell.backgroundColor = UIColor.clear
        
        // Установка прозрачного фона контента ячейки
        cell.contentView.backgroundColor = UIColor.clear
        
        return cell
    }
}
