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
    private var filteredResults = [[String]]()
    private let originalResults: [[String]]

    func loadSearchResults(searchText: String) {
        if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            filteredResults = originalResults.map({ (group) -> [String] in
                return group.filter { $0.lowercased().contains(searchText.lowercased())}
            })
        } else {
            filteredResults = originalResults
        }
    }

    func jumpTo() -> IndexPath? {
        guard filteredResults != originalResults else { return nil }
        var indexPath: IndexPath?

        for section in filteredResults.indices where filteredResults[section].count > 0 {
            indexPath = IndexPath(row: 0, section: section)
            break
        }
        return indexPath
    }

    init() {
        var groupNames = [[String]]()
        chatroomGroups.forEach { (group) in
            groupNames.append(group.names)
        }
        self.originalResults = groupNames
        self.filteredResults = self.originalResults
    }

    subscript(section: Int) -> (title: String, names: [String]) {
        return (title: chatroomGroups[section].title, names: filteredResults[section])
    }

    subscript(section: Int, row: Int) -> String {
        return filteredResults[section][row]
    }

    subscript(section: Int) -> [String] {
        return filteredResults[section]
    }

    var count: Int {
        return chatroomGroups.count
    }
}

