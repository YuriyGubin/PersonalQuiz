//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Yuriy on 14.02.2023.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
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
}
