//
//  FeedAPIInput.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/05/08.
//


// 서버 연동할 때 보내주는 것들
struct FeedAPIInput : Encodable {
    var limit : Int?
    var page: Int?
}
