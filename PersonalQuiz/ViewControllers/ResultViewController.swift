//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Yuriy on 14.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        iconLabel.text = "Вы - \(calculateCommonAnimal(fromAnswers: answers).rawValue)!"
        descriptionLabel.text = calculateCommonAnimal(fromAnswers: answers).definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        
        // Work normal
        //dismiss(animated: true)
        
        // If you have'nt navigation controller
        //view.window?.rootViewController?.dismiss(animated: true)
    }
    
    // Check View Controller unloaded from memory
//    deinit {
//        print("\(type(of: self)) has been deallocated")
//    }
    
    private func calculateCommonAnimal(fromAnswers answers: [Answer]) -> Animal {
        let commonAnswers = answers.map { $0.animal }

        var animals: [Animal: Int] = [:]
      //  var maxValue = 0
        
        commonAnswers.forEach { animal in
            if let count = animals[animal] {
                animals[animal] = count + 1
            } else {
                animals[animal] = 1
            }
        }
        
        let commonAnimals = animals.sorted { $0.value > $1.value }
        let animal = commonAnimals.first?.key
        
//        for (key, value) in animals {
//            if value > maxValue {
//                maxValue = value
//                animal = key
//            }
//        }
        
        return animal ?? .turtle
    }
}
