//
//  TrainInquiryViewCell.swift
//  Korail-iOS
//
//  Created by 몽이 누나 on 2022/11/21.
//

import UIKit
import SnapKit
import Then

class TrainInquiryViewCell: UITableViewCell {

    static let identifier = "TrainInquiryViewCell"
    
    private let infoContainerView = UIView()
    
    private let trainLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 14)
    }
    
    private let departureLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 14)
    }
    
    private let arrivalLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 14)
    }

    private let standardRoomInfoButton = UIButton(type: .system).then {
        $0.setTitle(".", for: .normal)
//        $0.titleLabel?.font = UIFont.font(.pretendardSemiBold, ofSize: 14)
//        $0.setTitleColor(UIColor.white, for: .selected)
//        $0.setTitleColor(UIColor.korailPrimaryColor, for: .normal)
//
//        $0.layer.cornerRadius = 20
//        $0.layer.borderWidth = 1
//        $0.layer.borderColor = UIColor.korailPrimaryColor
    }
    
    private let suiteRoomInfoLabel = UILabel().then {
        $0.textColor = .korailPrimaryColor
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 14)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrainInquiryViewCell {
    
    private func layout() {
        contentView.addSubviews(
            infoContainerView,
            trainLabel,
            departureLabel,
            arrivalLabel,
            standardRoomInfoButton,
            suiteRoomInfoLabel
        )
        
        infoContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(67)
        }
        
        trainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalTo(contentView.snp.leading).offset(37.5)
        }
        
        departureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalTo(contentView.snp.leading).offset(102.5)
        }
        
        arrivalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalTo(contentView.snp.leading).offset(162.5)
        }
        
        suiteRoomInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalTo(contentView.snp.trailing).offset(-45)
        }
        
        standardRoomInfoButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.centerX.equalTo(contentView.snp.trailing).offset(-124)
            $0.width.equalTo(70)
            $0.height.equalTo(36)
        }
    }
    
    func dataBind(model: TrainInquiryModel) {
        trainLabel.text = model.train
        departureLabel.text = model.departure
        arrivalLabel.text = model.arrival
        suiteRoomInfoLabel.text = model.suiteRoomInfo
//        standardRoomInfoButton.text = model.standardRoomInfo
    }
}
