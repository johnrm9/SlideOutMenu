//
//  ChatroomMenuCell.swift
//  SlideOutMenu
//
//  Created by John Martin on 10/7/18.
//  Copyright © 2018 John Martin. All rights reserved.
//

import UIKit

class ChatroomMenuCell: BaseCell {

    var chatGroupName: String? {
        didSet {
            guard let chatGroupName = chatGroupName else { return }
            let attributedText = NSMutableAttributedString(string: "#  ",
                    attributes: [.foregroundColor: UIColor.chatroomTextColor, .
                                             font: UIFont.systemFont(ofSize: 18, weight: .regular)])
            attributedText.append(NSAttributedString(string: chatGroupName,
                                                 attributes: [.foregroundColor: UIColor.white]))
            textLabel?.attributedText = attributedText
        }
    }

    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .chatroomCellColor
        view.layer.cornerRadius = 5
        self.addSubview(view)
        view.fillSuperview(padding: .init(horizontal: 8))
        sendSubviewToBack(view)
        return view
    }()

    override func setupViews() {
        super.setupViews()
        backgroundColor = .clear
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bgView.isHidden = !selected
    }
}
