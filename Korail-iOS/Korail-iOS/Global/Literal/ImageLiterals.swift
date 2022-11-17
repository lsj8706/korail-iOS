//
//  ImageLiterals.swift
//  Korail-iOS
//
//  Created by sejin on 2022/11/14.
//

import UIKit

enum ImageLiterals {
    static var icArrow: UIImage { .load(named: "ic_arrow") }
    static var icBigLeft: UIImage { .load(named: "ic_bigleft") }
    static var icCalendar: UIImage { .load(named: "ic_calendar") }
    static var icChange: UIImage { .load(named: "ic_change") }
    static var icCheck: UIImage { .load(named: "ic_check") }
    static var icDeclare: UIImage { .load(named: "ic_declare") }
    static var icDrop: UIImage { .load(named: "ic_drop") }
    static var icGive: UIImage { .load(named: "ic_give") }
    static var icHelp: UIImage { .load(named: "ic_help") }
    static var icInfo: UIImage { .load(named: "ic_info") }
    static var icMinus: UIImage { .load(named: "ic_minus") }
    static var icPerson: UIImage { .load(named: "ic_person") }
    static var icPlus: UIImage { .load(named: "ic_plus") }
    static var icRefund: UIImage { .load(named: "ic_refund") }
    static var icReserveSelect: UIImage { .load(named: "ic_reserve_select") }
    static var icReserve: UIImage { .load(named: "ic_reserve") }
    static var icSmallArrow: UIImage { .load(named: "ic_smallarrow") }
    static var icTicketCheckSelect: UIImage { .load(named: "ic_ticket_check_select") }
    static var icTicketCheck: UIImage { .load(named: "ic_ticket_check") }
    static var icTicketSelect: UIImage { .load(named: "ic_ticket_select") }
    static var icTicket: UIImage { .load(named: "ic_ticket") }
    static var icTravelSelect: UIImage { .load(named: "ic_travel_select") }
    static var icTravel: UIImage { .load(named: "ic_travel") }
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
