//
//  CourseTableViewCell.swift
//  ZappyCode
//
//  Created by qualson1 on 2022/06/30.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet var courseSubTitle: UILabel!
    @IBOutlet var courseTitle: UILabel!
    @IBOutlet var courseImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
