//
//  SwitchTableViewCell.swift
//  SettingsUI
//
//  Created by gokul v on 22/04/24.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    static let identifier = "SwitchTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let _switch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemBlue
        return mySwitch
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(_switch)
        contentView.clipsToBounds = true
        accessoryType = .none  // side greaterthan symbol
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15,
                                     y: 6,
                                     width: size,
                                     height: size)
        
        let imageSize = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2,
                                     y: (size-imageSize)/2,
                                     width: imageSize,
                                     height: imageSize)
        
        _switch.sizeToFit()
        _switch.frame = CGRect(x: contentView.frame.size.width - _switch.frame.size.height - 30,
                               y: (contentView.frame.size.height - _switch.frame.size.height)/2,
                               width: _switch.frame.size.width,
                               height: _switch.frame.size.height)
        
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width + 15 - iconImageView.frame.size.width,
                             height: contentView.frame.size.height
                            )
    }
    
     func configure(with model: SettingSwitchOption) {
        iconContainer.backgroundColor = model.iconBackgroundColor
        iconImageView.image = model.icon
        label.text = model.title
        _switch.isOn = model.isOn
    }
    
    func android() {
        
    }
}
