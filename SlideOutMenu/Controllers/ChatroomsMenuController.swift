//
//  ChatroomsMenuController.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/7/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

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

    private let chatRoomGroupsList = ChatRoomGroupsList()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .chatrromsBackgroundColor
        tableView.alwaysBounceVertical = true
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let text = chatRoomGroupsList[section].title
        return ChatroomHeaderLabel(text: text)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatRoomGroupsList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoomGroupsList[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: nil)

        let chatGroupName = chatRoomGroupsList[indexPath.section, indexPath.row]
        cell.chatGroupName = chatGroupName

        return cell
    }
}
