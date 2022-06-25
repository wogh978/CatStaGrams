//
//  ProfileCollectionViewCell.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/04/30.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    static let identifier = "ProfileCollectionViewCell"
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var addProfileImageView: UIImageView!
    
    
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    
    @IBOutlet weak var followerCountLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
        // Initialization code
    }

    @IBOutlet weak var editButton: UIButton!
    private func setupAttribute() {
        
        profileImageView.layer.cornerRadius = 88 / 2
        addProfileImageView.layer.cornerRadius = 24/2
        
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        [postingCountLabel, followerCountLabel, followingCountLabel]
            .forEach { $0.text = "\(Int.random(in : 0...10))"
            }
    }
    
}
