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
        for answer in answers {
            switch answer.animal {
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        let chosenAnimals: [Animal: Int] = [
            .dog: dogCount,
            .cat: catCount,
            .rabbit: rabbitCount,
            .turtle: turtleCount
        ]
        if let yourAnimal = chosenAnimals.sorted(by: { $0.value > $1.value }).first?.key {
            animalLabel.text = "Вы - \(yourAnimal.rawValue)"
            descriptionLabel.text = yourAnimal.definition
        }
        
    }
}

