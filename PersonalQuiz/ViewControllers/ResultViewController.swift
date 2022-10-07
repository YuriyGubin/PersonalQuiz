//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Yuriy on 07.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    private var dogCount = 0
    private var catCount = 0
    private var rabbitCount = 0
    private var turtleCount = 0
    
    var answers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        calculateChosenAnimals()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func calculateChosenAnimals() {
        var chosenAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        for animal in animals {
            chosenAnimals[animal] = (chosenAnimals[animal] ?? 0) + 1
        }
//        let chosenAnimals = answers.reduce(into: [Animal: Int]()) {
//            (counts, answer) in
//            if let count = counts[answer.animal] {
//                counts[answer.animal] = count + 1
//            } else {
//                counts[answer.animal] = 1
//            }
//       }
        if let yourAnimal = chosenAnimals.sorted(by: { $0.value > $1.value }).first?.key {
            animalLabel.text = "Вы - \(yourAnimal.rawValue)"
            descriptionLabel.text = yourAnimal.definition
        }
        
    }
}

