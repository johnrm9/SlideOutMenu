//
//  ChatRoomGroupsList.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/9/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import Foundation

struct ChatRoomGroup {
    let title: String
    let names: [String]
}

class ChatRoomGroupsList {
    private let chatroomGroups = [
        ChatRoomGroup(title: "UNREADS", names: ["general", "introductions"]),
        ChatRoomGroup(title: "CHANNELS", names: ["jobs"]),
        ChatRoomGroup(title: "DIRECT MESSAGES", names: ["Brian Voong", "Steve Jobs", "Tim Cook", "Donald J. Trump"])
    ]

    subscript(section: Int) -> (title: String, names: [String]) {
        return (title: chatroomGroups[section].title, names: chatroomGroups[section].names)
    }

    subscript(section: Int, row: Int) -> String {
        return chatroomGroups[section].names[row]
    }

    subscript(section: Int) -> [String] {
        return chatroomGroups[section].names
    }

    var count: Int {
        return chatroomGroups.count
    }
}

