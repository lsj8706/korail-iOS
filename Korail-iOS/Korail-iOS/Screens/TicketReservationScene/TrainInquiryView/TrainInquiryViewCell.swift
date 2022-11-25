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
    

    public var checkDummy : Int = 0
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
        $0.titleLabel?.font = UIFont.font(.pretendardSemiBold, ofSize: 14)
        $0.setTitleColor(UIColor.white, for: .selected)
        $0.setTitleColor(UIColor.korailPrimaryColor, for: .normal)
        
        $0.layer.cornerRadius = 18
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.korailPrimaryColor.cgColor

        
    }
    
    private let suiteRoomInfoButton = UIButton(type: .system).then {
        $0.setTitle(".", for: .normal)
        $0.titleLabel?.font = UIFont.font(.pretendardSemiBold, ofSize: 14)
        $0.setTitleColor(UIColor.white, for: .selected)
        $0.setTitleColor(UIColor.korailPrimaryColor, for: .normal)

        $0.layer.cornerRadius = 18
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.korailPrimaryColor.cgColor
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
            suiteRoomInfoButton
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
        
        suiteRoomInfoButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalTo(contentView.snp.trailing).offset(-45)
            $0.width.equalTo(70)
            $0.height.equalTo(36)
        }
        
        standardRoomInfoButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalTo(contentView.snp.trailing).offset(-124)
            $0.width.equalTo(70)
            $0.height.equalTo(36)
        }
    }
    
    func dataBind(model: TrainInquiryModel) {
        trainLabel.text = model.train
        departureLabel.text = model.departure
        arrivalLabel.text = model.arrival
        suiteRoomInfoButton.setTitle(model.suiteRoomInfo, for: .normal)
        standardRoomInfoButton.setTitle(model.standardRoomInfo, for: .normal)
        
        if (model.standardRoomInfo == "매진") {
            trainLabel.textColor = .korailGray2
            departureLabel.textColor = .korailGray2
            arrivalLabel.textColor = .korailGray2
            
            standardRoomInfoButton.setTitleColor(UIColor.korailGray2, for: .normal)
            standardRoomInfoButton.layer.borderColor = UIColor.korailGray2.cgColor
            standardRoomInfoButton.isEnabled = false
        }
        
        if (model.suiteRoomInfo == "-") {
            suiteRoomInfoButton.layer.borderColor = UIColor.clear.cgColor
            suiteRoomInfoButton.setTitleColor(UIColor.korailGray2, for: .normal)
            suiteRoomInfoButton.isEnabled = false
            checkDummy = 1
        }
        
        
    }
    
    func selectedButtonColor() {
        
        self.standardRoomInfoButton.backgroundColor = .korailPrimaryColor
        self.standardRoomInfoButton.setTitleColor(.white, for: .normal)
        
        if checkDummy == 1 {
            return
        } else {
            self.suiteRoomInfoButton.backgroundColor = .korailPrimaryColor
            self.suiteRoomInfoButton.setTitleColor(.white, for: .normal)
        }
        
    }
    
    func deselectedButtonColor() {
        
        self.standardRoomInfoButton.backgroundColor = .white
        self.standardRoomInfoButton.setTitleColor(UIColor.korailPrimaryColor, for: .normal)
        
        if checkDummy == 1 {
            return
        } else {
            self.suiteRoomInfoButton.backgroundColor = .white
            self.suiteRoomInfoButton.setTitleColor(UIColor.korailPrimaryColor, for: .normal)
        }
        
    }
    
    private func setData(data: TrailInquiryResponseData) {
        trainLabel.text = data.trainName
        departureLabel.text = data.startTime
        arrivalLabel.text = data.lastTime
        standardRoomInfoButton.titleLabel?.text = "\(data.normalPrice)₩"
        suiteRoomInfoButton.titleLabel?.text =
        "\(data.specialPrice)₩"
    }

}

