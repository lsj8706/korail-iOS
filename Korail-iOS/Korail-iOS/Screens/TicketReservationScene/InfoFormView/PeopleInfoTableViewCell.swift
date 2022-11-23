//
//  PeopleInfoTableViewCell.swift
//  Korail-iOS
//
//  Created by 누리링 on 2022/11/23.
//

import UIKit
import SwiftyColor


class PeopleInfoTableViewCell: UITableViewCell {
    
    static let identifier = "PeopleInfoTableViewCell"

    
    private let topContainerView = UIView()
    private let profileImageView = UIImageView()
    private let textStackView = UIStackView().then {
      $0.axis = .vertical
      $0.spacing = 8.0
    }
    
    
    private let infoName = UILabel().then{
        $0.textColor = .black
    }
    
    private let infoDescription = UILabel().then{
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 8, weight: .medium)

    }
    
    
    private let plusDescription = UIButton().then{
        $0.layer.cornerRadius = 17
    }

    private let btnPlus = UIButton().then{
        $0.layer.cornerRadius = 17
        
    }
    
    private let peopleNum = UILabel().then{
        $0.textColor = .black
    }
    
    private let btnMinus = UIButton().then {
        $0.layer.cornerRadius = 17
    }
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PeopleInfoTableViewCell{
    private func layout(){
        backgroundColor = .white
        contentView.backgroundColor = .clear
        
        
        [infoName, infoDescription, plusDescription, btnPlus, peopleNum, btnMinus].forEach {
            contentView.addSubview($0)
        }


        infoName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(22)
            $0.width.equalTo(25)
            $0.height.equalTo(17)
        }
        
        infoDescription.snp.makeConstraints{
            $0.leading.equalTo(infoName.snp.leading).offset(5)
            $0.top.equalToSuperview().offset(5)
        }
        
        
        plusDescription.snp.makeConstraints{
            $0.leading.equalTo(infoName.snp.leading).offset(11)
            $0.top.equalToSuperview().offset(29)
        }
        
        btnMinus.snp.makeConstraints{
            $0.top.equalToSuperview().offset(29)
            $0.leading.equalToSuperview().offset(230)
        }
        
        peopleNum.snp.makeConstraints{
            $0.top.equalToSuperview().offset(29)
        }
        
        btnPlus.snp.makeConstraints{
            $0.top.equalToSuperview().offset(29)
            $0.leading.equalToSuperview().offset(315)

        }
        
    }
}




