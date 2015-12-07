//
//  Cell.swift
//  Pirate
//
//  Created by Giovanni on 9/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Cartography

class Cell: UITableViewCell {

  let _imageView: UIImageView
  let _titleLabel: UILabel
  let _descriptionLabel: UILabel

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    guard let image = UIImage(named: "Image") else {
      fatalError("Missing embedded asset")
    }
    _imageView = UIImageView(image: image)

    _titleLabel = UILabel()
    _titleLabel.numberOfLines = 0
    _titleLabel.text = "A very long text. A very long text. A very long text. A very long text. A very long text. A very long text."

    _descriptionLabel = UILabel()
    _descriptionLabel.numberOfLines = 0
    _descriptionLabel.text = "A very long text. A very long text. A very long text. A very long text. A very long text. A very long text. A very long text. A very long text. A very long text. A very long text. A very long text. A very long text."

    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(_imageView)
    contentView.addSubview(_titleLabel)
    contentView.addSubview(_descriptionLabel)

    setContraints()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    superview?.layoutSubviews()

    contentView.layoutIfNeeded()

    _titleLabel.preferredMaxLayoutWidth = contentView.frame.size.width - 8 - _imageView.frame.size.height - 8
    _descriptionLabel.preferredMaxLayoutWidth = contentView.frame.size.width - 8 - _imageView.frame.size.height - 8
  }

  func setContraints() {
    constrain(_imageView) { view in
      guard let superview = view.superview else {
        return
      }

      view.width == 60
      view.height == 60

      view.leading == superview.leading + 10
      view.top == superview.top + 10
    }

    constrain(_titleLabel, _imageView) { label, image in
      guard let superview = label.superview else {
        return
      }

      label.leading == image.trailing + 8
      label.top == image.top
      label.trailing == superview.trailing - 8
    }

    constrain(_descriptionLabel, _titleLabel, _imageView) { label, titleLabel, image in
      guard let superview = label.superview else {
        return
      }

      label.leading == image.trailing + 8
      label.top == titleLabel.bottom + 8
      label.trailing == superview.trailing - 8
      label.bottom == superview.bottom - 8
    }
  }
}
