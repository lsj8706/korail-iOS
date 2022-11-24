//
//  PeopleInfoTableViewCell.swift
//  Korail-iOS
//
//  Created by 누리링 on 2022/11/23.
//

import UIKit

import SnapKit
import SwiftyColor
import Then


class PeopleInfoTableViewCell: UITableViewCell {

//    let infoName : String
//    let infoDescription : String
//    let btnMinus : String
//    let peopleNum : String
//    let btnPlus : String

    
    static let identifier = "PeopleInfoTableViewCell"

    
    private let topContainerView = UIView()
        
    private let textStackView = UIStackView().then {
      $0.axis = .vertical
      $0.spacing = 8.0
    }
    
    
    private let infoName = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 13, weight: .medium)

    }
    
    private let infoDescription = UILabel().then{
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 8, weight: .medium)

    }
    
    
    private let plusDescription = UIButton().then{
        $0.layer.cornerRadius = 17
        $0.setBackgroundImage(UIImage(systemName: "ic_plus"), for: .normal)

    }

    private let btnPlus = UIButton().then{
        $0.layer.cornerRadius = 17
        $0.setBackgroundImage(UIImage(systemName: "ic_plus"), for: .normal)
        
    }
    
    private let peopleNum = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 13, weight: .medium)

    }
    
    private let btnMinus = UIButton().then {
        $0.layer.cornerRadius = 17
        $0.setBackgroundImage(UIImage(systemName: "ic_minus"), for: .normal)

    }
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(btnPlus)
        addSubview(btnMinus)


        layout()
        
        let stackView = UIStackView(arrangedSubviews: [btnMinus,btnPlus])
         stackView.distribution = .equalSpacing
         stackView.axis = .horizontal
         stackView.spacing = 5
         addSubview(stackView)
         
         }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension PeopleInfoTableViewCell{
    private func layout(){
        backgroundColor = .white
        contentView.backgroundColor = .clear
        
        
        [topContainerView, infoName, infoDescription, btnPlus, peopleNum, btnMinus].forEach {
            contentView.addSubview($0)
        }
        
        
        topContainerView.addSubview(textStackView)

        
        infoName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(41)
            $0.width.equalTo(80)
            $0.height.equalTo(12)
        }
        
        infoDescription.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(41)
            $0.top.equalTo(infoName.snp.bottom).offset(5)
        }
        

        
//        plusDescription.snp.makeConstraints{
//            $0.leading.equalTo(infoName.snp.leading).offset(11)
//            $0.top.equalToSuperview().offset(29)
//        }
        
        
        
        btnMinus.snp.makeConstraints{
            $0.top.equalToSuperview().offset(29)
            $0.leading.equalToSuperview().offset(230)
        }
        
        peopleNum.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(330)
            $0.width.equalTo(50)

        }
        
        btnPlus.snp.makeConstraints{
            $0.top.equalToSuperview().offset(29)
            $0.leading.equalToSuperview().offset(315)

        }
        
    }
    
    
    func dataBind(model: InfoModel){
        
//        let infoName : String
//        let infoDescription : String
//        let plusDescription : String
//        let btnMius : String
//        let peopleNum : String
//        let btnPlus : String'
        
        infoName.text = model.infoName
        infoDescription.text = model.infoDescription
      //  btnMinus.button = UIButton(type: model.btnMinus)
        peopleNum.text = model.peopleNum
        //btnPlus.button = UIButton(type: model.btnPlus)


    }
    
}




