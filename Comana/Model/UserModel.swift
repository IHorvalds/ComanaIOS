//
//  UserModel.swift
//  Comana
//
//  Created by Tudor Croitoru on 16/10/2021.
//

import Foundation

class UserModel: Codable {
    
    private var userIdentifier: UUID // we don't update this. ever. unless user says so in settings
    public var userName: String
    public var isInParty: Bool = false
    
    // Positive adjectives. 44 of them.
    static let adjectives = [
         "Adaptable",
         "Adventurous",
         "Amarous",
         "diligent",
         "Humble",
         "Courageous",
         "Efficient",
         "Enchanting",
         "Generous",
         "Magnetic",
         "Likeable",
         "Sincere",
         "Trustworthy",
         "Resourceful",
         "Wise",
         "Resilient",
         "Reliable",
         "Determined",
         "Strong",
         "Stupendous",
         "Exceptional",
         "Generous",
         "Kind",
         "Persuasive",
         "Vivacious",
         "Witty",
         "Extraordinary",
         "Divine",
         "Breathtaking",
         "Flawless",
         "Magnificent",
         "Lively",
         "Versatile",
         "Amazing",
         "Outgoing",
         "amicable",
         "Friendly",
         "Perseverant",
         "Enthusiastic",
         "Affectionate",
         "Thoughtful",
         "Modest",
         "Hygienic",
         "Considerate",
         "Courteous"
    ]
    
    // Cute animals. 44 of them
    static let animals = [
        "Red Panda",
        "Quokka",
        "Panda",
        "Dog",
        "Fennec Fox",
        "Rabbit",
        "Koala",
        "Otter",
        "Meerkat",
        "Hedgehog",
        "Raccoon",
        "Flamingo",
        "Cat",
        "Lion",
        "Hamster",
        "Parrot",
        "Chameleon",
        "Tiger",
        "Turtle",
        "Squirrel",
        "Frog",
        "Bear",
        "Pangolin",
        "Armadillo",
        "Beaver",
        "Xerus",
        "Fossa",
        "Cuttlefish",
        "Narwhal",
        "Lynx",
        "Pika",
        "Klipspringer",
        "Margay",
        "Capybara",
        "Quoll",
        "Bongo",
        "Axolotl",
        "Kangaroo",
        "Bearded Tamarin",
        "Dolphin",
        "Owl",
        "Wolf",
        "Sea Lion",
        "Deer",
        "Walrus"
    ]
    
    static let shared: UserModel = UserModel()
    
    
    
    /// Initialize completely new identifier.
    private init() {
        if let identifier = UserDefaultsHelper.shared.getUserIdentifier() {
            self.userIdentifier = identifier
        } else {
            self.userIdentifier = UUID()
            UserDefaultsHelper.shared.setUserIdentifier(id: self.userIdentifier)
        }
        
        
        if !isInParty, let userName = UserDefaultsHelper.shared.getUserName() {
            self.userName = userName
        } else {
            let username: String = UserModel.adjectives.randomElement()! + " " + UserModel.animals.randomElement()!
            
            self.userName = username
            UserDefaultsHelper.shared.setUserName(name: self.userName)
        }
        
    }
    
    func getIdentifier() -> UUID {
        return self.userIdentifier
    }
    
    /// Reset user name. Maybe they don't like animals
    func resetUserName(userName: String?, generate: Bool = true) {
        if generate {
            let userNameGenerated: String = UserModel.adjectives.randomElement()! + " " + UserModel.animals.randomElement()!
            self.userName = userNameGenerated
            
            UserDefaultsHelper.shared.setUserName(name: userNameGenerated)
            return
        }
        
        if let userName = userName {
            self.userName = userName
        } else  {
            let userNameGenerated: String = UserModel.adjectives.randomElement()! + " " + UserModel.animals.randomElement()!
            self.userName = userNameGenerated
        }
        
        UserDefaultsHelper.shared.setUserName(name: self.userName)
    }
    
    /// Destructive. All known data about user is lost. Maybe destroy stale data in database so we don't have to care about gdpr.
    func resetIdentifier() {
        self.userIdentifier = UUID()
        UserDefaultsHelper.shared.setUserIdentifier(id: self.userIdentifier)
    }
    
}
