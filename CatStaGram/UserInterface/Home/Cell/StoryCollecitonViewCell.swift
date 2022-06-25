//
//  StoryCollecitonViewCell.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/04/29.
//

import UIKit

class StoryCollecitonViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageViewBackground: UIView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
    }
    

}
