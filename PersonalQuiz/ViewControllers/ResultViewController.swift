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
    
    var finalAnswers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        let yourAnimal = getYourAnimal(from: finalAnswers)
        animalLabel.text = "Вы - \(yourAnimal.rawValue)"
        descriptionLabel.text = yourAnimal.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func getYourAnimal(from answers: [Answer]) -> Animal {
        var chosenAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        for animal in animals {
            chosenAnimals[animal] = (chosenAnimals[animal] ?? 0) + 1
        }
        guard let yourAnimal = chosenAnimals.sorted(by: { $0.value > $1.value }).first?.key else { return .rabbit}
        return yourAnimal
    }
}

