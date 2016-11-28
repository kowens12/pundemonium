//
//  CategoryModel.swift
//  emojis
//
//  Created by Katherine Owens on 9/12/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import Foundation

let categoryDidChange: Notification.Name = Notification.Name(rawValue: "categoryChanged")

@objc
public class Category : NSObject, NSCoding {
    
    public static var categories: [Category] = Category.loadCategories()
    
    var name: String
    var emoji: String
    var topics: [Topic]
    
    init(name: String, emoji: String, topics: [Topic]) {
        self.name = name
        self.emoji = emoji
        self.topics = topics
    }
    
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(emoji, forKey: "emoji")
        aCoder.encode(topics, forKey: "topics")
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        
        guard let name = aDecoder.decodeObject(forKey: "name") as? String,
            let emoji = aDecoder.decodeObject(forKey: "emoji") as? String,
            let topics = aDecoder.decodeObject(forKey: "topics") as? [Topic]
            
            else { return nil }
        
        self.init(name: name, emoji: emoji, topics: topics)
    }
    
    
    static func saveCategories() {
        let data = NSKeyedArchiver.archivedData(withRootObject: categories)
        
        UserDefaults.standard.set(data, forKey: "categories")
    }
    
    static func loadCategories() -> [Category] {
        if let data = UserDefaults.standard.data(forKey: "categories"),
            let savedCategories = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Category] {
            return savedCategories
        }
        return [Category(name:"cat", emoji:"😸", topics: [Topic(name: "paws"),
                                                            Topic(name:"tails"),
                                                            Topic(name:"fur"),
                                                            Topic(name:"pussyfoot"),
                                                            Topic(name:"purr"),
                                                            Topic(name:"kitten"),
                                                            Topic(name:"meow")]),
                Category(name: "car", emoji: "🚗", topics: ["motor", "speed", "shift", "wheel", "tire"].map { return Topic(name: $0)})
        ]
        
    }
}



@objc
public class Topic : NSObject, NSCoding {
    
    public static var topic: Topic = Topic.loadTopic()
    
    var name: String
    var usage: String? = nil
    var rating: Float? = nil
    
    init(name: String, usage: String? = nil, rating: Float? = nil) {
        self.usage = usage
        self.rating = rating
        self.name = name
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        
        if let usage = usage {
            aCoder.encode(usage, forKey: "usage")
        }
        
        if let rating = rating {
            aCoder.encode(rating, forKey: "rating")
        }
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String
            
            else { return nil }
        
        self.init(name: name, usage: aDecoder.decodeObject(forKey: "usage") as? String, rating: aDecoder.decodeObject(forKey: "rating") as? Float)
    }

    
    static func saveTopicInfo() {
        let data = NSKeyedArchiver.archivedData(withRootObject: topic)
        
        UserDefaults.standard.set(data, forKey: "topic")
    }
    
    static func loadTopic() -> Topic {
        if let data = UserDefaults.standard.data(forKey: "topic"),
            let savedTopic = NSKeyedUnarchiver.unarchiveObject(with: data) as? Topic {
            return savedTopic
        }
         return Topic(name: topic.name, usage: "How did you use this topic?", rating: 0.0)
        }
    }
