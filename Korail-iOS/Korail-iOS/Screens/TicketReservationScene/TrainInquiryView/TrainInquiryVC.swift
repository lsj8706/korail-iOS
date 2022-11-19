//
//  TrainInquiryVC.swift
//  Korail-iOS
//
//  Created by 몽이 누나 on 2022/11/19.
//

import UIKit
import SnapKit
import Then

class TrainInquiryVC: UIViewController {

    private let contentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.applyShadow(alpha: 0.1, x: 0, y: 0, blur: 8)
    }
    
    
    
    private let topView = UIView()
    private let middleView = UIView()
    
    private let departureLabel = UILabel().then {
        $0.text = "서울"
        $0.textColor = .black
        $0.font = UIFont.font(.pretendardMedium, ofSize: 18)
    }
    
    private let rightArrowImageView = UIImageView().then {
        $0.image = ImageLiterals.icArrow
        $0.tintColor = .black
    }
    
    private let arrivalLabel = UILabel().then {
        $0.text = "천안"
        $0.textColor = .black
        $0.font = UIFont.font(.pretendardMedium, ofSize: 18)
    }
    
    private let previousDateArrowButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icBigLeft, for: .normal)
    }
    
    private let selectedDateLabel = UILabel().then {
        $0.text = "2022.11.05 (토)"
        $0.textColor = .black
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 18)
    }
    
    private let selectOptionButton1 = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("전체", attributes: container)
        config.image = ImageLiterals.icDrop
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 9
        $0.configuration = config
    }
    
    private let selectOptionButton2 = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("일반석", attributes: container)
        config.image = ImageLiterals.icDrop
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 9
        $0.configuration = config
    }
    
    private let selectOptionButton3 = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("직통", attributes: container)
        config.image = ImageLiterals.icDrop
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 9
        $0.configuration = config
    }
    
    private lazy var ticketInfoFormStackView = UIStackView(arrangedSubviews: [selectOptionButton1, selectOptionButton2, selectOptionButton3]).then {
        $0.axis = .vertical
        $0.spacing = 9
        $0.distribution = .fillEqually
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setNavigationBar()
    }


}

extension TrainInquiryVC {
    
    private func setNavigationBar() {
        self.navigationItem.title = "열차 조회"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: FontName.pretendardMedium.rawValue, size: 20), size: 20)]
    }
    
    private func setUI() {
        view.backgroundColor = .korailGray1
    }
    
    private func setLayout() {
        view.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(17)
        }
        
        contentView.addSubviews(
            departureLabel,
            rightArrowImageView,
            arrivalLabel,
            topView,
            middleView
        )
        
        topView.addSubviews(
            previousDateArrowButton,
            selectedDateLabel
        )
        
        rightArrowImageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(22)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(12)
        }
        
        departureLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalTo(rightArrowImageView.snp.leading)
        }
        
        arrivalLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(rightArrowImageView.snp.trailing)
        }
        
        topView.snp.makeConstraints {
            $0.top.equalTo(rightArrowImageView.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        selectedDateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        previousDateArrowButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(4.84)
            $0.height.equalTo(11.29)
        }
        
        middleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(43)
        }
        
        
    }
    
}
