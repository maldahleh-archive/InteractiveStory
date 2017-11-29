//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Mohammed Al-Dahleh on 2017-11-28.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "startAdventure" { return }
        
        guard let pageController = segue.destination as? PageController else { return }
        
        pageController.page = Adventure.story(withName: "Test")
    }
}

