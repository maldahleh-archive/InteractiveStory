//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Mohammed Al-Dahleh on 2017-11-28.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "startAdventure" { return }
        
        guard let destination = segue.destination as? PageController else { return }
        
        destination.page = Adventure.story
    }
}
