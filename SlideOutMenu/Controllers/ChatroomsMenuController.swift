//
//  ChatroomsMenuController.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/7/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

struct ChatRoomGroup {
    let title: String
    let names: [String]
}

class ChatroomsMenuController: UITableViewController {
    fileprivate class ChatroomHeaderLabel: BaseLabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
        }
        convenience init(text: String) {
            self.init()
            self.text = text
            self.textColor = .chatroomTextColor
        }
    }
    private let chatroomGroups = [
        ChatRoomGroup(title: "UNREADS", names: ["general", "introductions"]),
        ChatRoomGroup(title: "CHANNELS", names: ["jobs"]),
        ChatRoomGroup(title: "DIRECT MESSAGES", names: ["Brian Voong", "Steve Jobs", "Tim Cook", "Donald J. Trump"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .chatrromsBackgroundColor
        tableView.alwaysBounceVertical = true
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return chatroomGroups[section].title
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let chatRoomGroup = chatroomGroups[section]
        let text = chatRoomGroup.title
        return ChatroomHeaderLabel(text: text)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatroomGroups.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatroomGroups[section].names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: nil)

        let chatGroupName = chatroomGroups[indexPath.section].names[indexPath.row]
        cell.chatGroupName = chatGroupName

        return cell
    }
}
