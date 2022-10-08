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
    
    var finalAnswers: [Answer] = []

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
        let animals = finalAnswers.map { $0.animal }
        for animal in animals {
            chosenAnimals[animal] = (chosenAnimals[animal] ?? 0) + 1
        }
       
        if let yourAnimal = chosenAnimals.sorted(by: { $0.value > $1.value }).first?.key {
            animalLabel.text = "Вы - \(yourAnimal.rawValue)"
            descriptionLabel.text = yourAnimal.definition + "\(finalAnswers)"
        }
        
    }
}

