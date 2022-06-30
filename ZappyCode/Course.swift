//
//  Course.swift
//  ZappyCode
//
//  Created by qualson1 on 2022/06/29.
//

import Foundation

// class 에 : 를 붙이고 뒤에 내용을 달아주는것은 서브클래스나 프로토콜을 추가한다는 뜻이다.
class Course: Codable {
    var title = ""
    var subtitle = ""
    var imageURL = ""
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
        case imageURL = "image"
    }
}
