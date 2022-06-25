//
//  PostCollectionViewCell.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/05/01.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"

    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    //외부 접근 위해
    public func setupData(){
        // 이미지뷰의 이미지를 업로드
    }
}
