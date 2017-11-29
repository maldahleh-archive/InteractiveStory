//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Mohammed Al-Dahleh on 2017-11-28.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "startAdventure" { return }
        
        guard let pageController = segue.destination as? PageController else { return }
        
        do {
            guard let name = nameTextField.text else { throw AdventureError.noNameEntered }
            
            if name == "" { throw AdventureError.noNameEntered }
            
            pageController.page = Adventure.story(withName: name)
        } catch AdventureError.noNameEntered {
            let alertController = createAlertControllerWith(title: "No Name Provided", message: "Please provide a name.")
            
            present(alertController, animated: true, completion: nil)
        } catch let error {
            let alertController = createAlertControllerWith(title: "Unknown Error", message: "\(error.localizedDescription)")
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func createAlertControllerWith(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        return alertController
    }
}

