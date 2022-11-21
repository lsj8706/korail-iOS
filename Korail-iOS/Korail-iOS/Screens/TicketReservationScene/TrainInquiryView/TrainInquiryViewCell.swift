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

    private let standardRoomInfoLabel = UILabel().then {
        $0.textColor = .korailPrimaryColor
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 14)
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
            standardRoomInfoLabel,
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
            $0.leading.equalToSuperview().offset(13)
        }
        
        departureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalTo(trainLabel.snp.trailing).offset(23)
        }
        
        arrivalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(departureLabel.snp.trailing).offset(20)
        }
        
        suiteRoomInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(18)
        }
        
        standardRoomInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalTo(suiteRoomInfoLabel.snp.leading).offset(-23)
        }
    }
    
    func dataBind(model: TrainInquiryModel) {
        trainLabel.text = model.train
        departureLabel.text = model.departure
        arrivalLabel.text = model.arrival
        suiteRoomInfoLabel.text = model.suiteRoomInfo
        standardRoomInfoLabel.text = model.standardRoomInfo
    }
}
