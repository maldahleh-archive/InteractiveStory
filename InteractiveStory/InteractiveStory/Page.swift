//
//  Page.swift
//  InteractiveStory
//
//  Created by Mohammed Al-Dahleh on 2017-11-29.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

typealias Choice = (title: String, page: Page)

class Page {
    let story: Story
    
    var firstChoice: Choice?
    var secondChoic: Choice?
    
    init(story: Story) {
        self.story = story
    }
}
