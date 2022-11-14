//
//  TabBarController.swift
//  Korail-iOS
//
//  Created by sejin on 2022/11/14.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarViewControllers()
        setUI()
    }
    
    //MARK: - Helpers
    func setUI() {
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .black
    }
    
    func setTabBarViewControllers() {
        
        let locationFormVC = LocationFormVC()
        
        let LocationFormNVC = templateNavigationController(title: "승차권 예매", unselectedImage: ImageLiterals.icReserve,
                                                           selectedImage: ImageLiterals.icReserveSelect,
                                                   rootViewController: locationFormVC)
        
        let InfoFormNVC = templateNavigationController(title: "할인•정기권", unselectedImage: ImageLiterals.icTicket,
                                                       selectedImage: ImageLiterals.icTicketSelect,
                                                     rootViewController: UIViewController())
        
        let TrainInquiryNVC = templateNavigationController(title: "관광상품", unselectedImage: ImageLiterals.icTravel,
                                                           selectedImage: ImageLiterals.icTravelSelect,
                                                    rootViewController: UIViewController())
        
        let TicketConfirmaionNVC = templateNavigationController(title: "승차권 확인", unselectedImage: ImageLiterals.icTicketCheck,
                                                                selectedImage: ImageLiterals.icTicketCheckSelect,
                                                   rootViewController: UIViewController())
        
        viewControllers = [LocationFormNVC, InfoFormNVC, TrainInquiryNVC, TicketConfirmaionNVC]
    }

    func templateNavigationController(title: String, unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.title = title
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = UIColor.korailPrimaryColor
        nav.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        nav.navigationItem.backBarButtonItem?.tintColor = .black
        return nav
    }
}
