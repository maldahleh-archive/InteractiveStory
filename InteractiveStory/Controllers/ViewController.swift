//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Mohammed Al-Dahleh on 2017-11-28.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Initalization and deinitialization methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Segue to story
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "startAdventure" { return }
        
        guard let pageController = segue.destination as? PageController else { return }
        
        do {
            guard let name = nameTextField.text else { throw AdventureError.noNameEntered }
            
            if name == "" { throw AdventureError.noNameEntered }
            
            pageController.page = Adventure.story(withName: name)
        } catch AdventureError.noNameEntered {
            presentAlertWith(title: "No Name Provided", message: "Please provide a name.")
        } catch let error {
            presentAlertWith(title: "Unknown Error", message: "\(error.localizedDescription)")
        }
    }
    
    // MARK: - Keyboard
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let info = notification.userInfo, let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let frame = keyboardFrame.cgRectValue
            textFieldBottomConstraint.constant = frame.size.height + 10
            
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textFieldBottomConstraint.constant = 40
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
        
        return true
    }
    
    // MARK: - Helper methods
    
    func presentAlertWith(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
