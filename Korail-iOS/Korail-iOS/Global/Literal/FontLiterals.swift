//
//  FontLiterals.swift
//  Korail-iOS
//
//  Created by sejin on 2022/11/14.
//

import UIKit

enum FontName: String {
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
