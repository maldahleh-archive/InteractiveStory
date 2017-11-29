//
//  PageController.swift
//  InteractiveStory
//
//  Created by Mohammed Al-Dahleh on 2017-11-29.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit

class PageController: UIViewController {
    
    var page: Page?
    
    // MARK: - User Interface Properties
    
    let artworkView = UIImageView()
    let storyLabel = UILabel()
    let firstChoiceButton = UIButton(type: .system)
    let secondChoiceButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let page = page {
            artworkView.image = page.story.artwork
            
            let attributedString = NSMutableAttributedString(string: page.story.text)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 10
            
            attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            storyLabel.attributedText = attributedString
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // MARK: - Constraints for Artwork view
        
        view.addSubview(artworkView)
        artworkView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            artworkView.topAnchor.constraint(equalTo: view.topAnchor),
            artworkView.leftAnchor.constraint(equalTo: view.leftAnchor),
            artworkView.rightAnchor.constraint(equalTo: view.rightAnchor),
            artworkView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // MARK: - Constraints for Story label
        
        view.addSubview(storyLabel)
        storyLabel.numberOfLines = 0
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            storyLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -48.0)
        ])
    }
}
