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
    var secondChoice: Choice?
    
    init(story: Story) {
        self.story = story
    }
}

extension Page {
    func addStoryWith(title: String, story: Story) -> Page {
        let page = Page(story: story)
        
        return addStoryWith(title: title, page: page)
    }
    
    func addStoryWith(title: String, page: Page) -> Page {
        switch (firstChoice, secondChoice) {
        case (.some, .some): return self
        case (.none, .none), (.none, .some): firstChoice = (title: title, page: page)
        case (.some, .none): secondChoice = (title: title, page: page)
        }
        
        return page
    }
}
