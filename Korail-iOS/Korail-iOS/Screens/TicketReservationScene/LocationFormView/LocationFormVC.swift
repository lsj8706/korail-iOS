//
//  LocationFormVC.swift
//  Korail-iOS
//
//  Created by sejin on 2022/11/14.
//

import UIKit
import SnapKit
import Then
import Moya

final class LocationFormVC: UIViewController {
    
    // MARK: - Properties
    
    private let trailProvider = MoyaProvider<TrailRouter>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // MARK: - UI Components
    
    private let contentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.applyShadow(alpha: 0.1, x: 0, y: 0, blur: 8)
    }
    
    private let roundTripTicketButton = UIButton(type: .system).then {
        $0.setTitle("왕복", for: .normal)
        $0.titleLabel?.font = UIFont.font(.pretendardSemiBold, ofSize: 18)
        $0.layer.cornerRadius = 20
        $0.setTitleColor(UIColor.white, for: .selected)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .korailPrimaryColor
        $0.isSelected = true
    }
    
    private let singleTripTicketButton = UIButton(type: .system).then {
        $0.setTitle("편도", for: .normal)
        $0.titleLabel?.font = UIFont.font(.pretendardSemiBold, ofSize: 18)
        $0.layer.cornerRadius = 20
        $0.setTitleColor(UIColor.white, for: .selected)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .white
    }
    
    private let dividerView = UIView().then {
        $0.backgroundColor = .korailGray1
    }
    
    private let departureLabel = UILabel().then {
        $0.text = "출발"
        $0.textColor = .korailGray2
        $0.font = UIFont.font(.pretendardMedium, ofSize: 16)
    }
    
    private let departureCityButton = UIButton(type: .system).then {
        var config = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardSemiBold, ofSize: 32)
        config.attributedTitle = AttributedString("서울", attributes: container)
        config.image = ImageLiterals.icDrop
        config.imagePlacement = .trailing
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.imagePadding = 7
        $0.configuration = config
    }
    
    private lazy var departureStackView = UIStackView(arrangedSubviews: [departureLabel, departureCityButton]).then {
        $0.axis = .vertical
        $0.spacing = 9
        $0.alignment = .center
    }
    
    private let locationSwitchButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icChange, for: .normal)
    }
    
    private let rightArrowImageView = UIImageView().then {
        $0.image = ImageLiterals.icArrow
        $0.tintColor = .black
    }
    
    private lazy var locationDirectionStackView = UIStackView(arrangedSubviews: [locationSwitchButton, rightArrowImageView]).then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillProportionally
    }
    
    private let arrivalLabel = UILabel().then {
        $0.text = "도착"
        $0.textColor = .korailGray2
        $0.font = UIFont.font(.pretendardMedium, ofSize: 16)
    }
    
    private let arrivalCityButton = UIButton(type: .system).then {
        
        var config = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardSemiBold, ofSize: 32)
        config.attributedTitle = AttributedString("천안", attributes: container)
        config.image = ImageLiterals.icDrop
        config.imagePlacement = .trailing
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.imagePadding = 7
        $0.configuration = config
    }
    
    private lazy var arrivalStackView = UIStackView(arrangedSubviews: [arrivalLabel, arrivalCityButton]).then {
        $0.axis = .vertical
        $0.spacing = 9
        $0.alignment = .center
    }
    
    private lazy var locationConfigureStackView = UIStackView(arrangedSubviews: [departureStackView, locationDirectionStackView, arrivalStackView]).then {
        $0.axis = .horizontal
        $0.spacing = 40
    }
    
    private lazy var departureDateButton = UIButton(type: .system).then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("12.14.월", attributes: container)
        config.image = ImageLiterals.icCalendar
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 9
        $0.configuration = config
        $0.addTarget(self, action: #selector(touchupDepartureDateButton), for: .touchUpInside)
    }
    
    private let arrivalDateButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("12.17.월", attributes: container)
        config.image = ImageLiterals.icCalendar
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 9
        $0.configuration = config
    }
    
    private lazy var dateStackView = UIStackView(arrangedSubviews: [departureDateButton, arrivalDateButton])
        .then {
            $0.axis = .horizontal
            $0.spacing = 5
        }
    
    private let numberOfPeopleButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("성인 1명", attributes: container)
        config.image = ImageLiterals.icPerson
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 9
        $0.configuration = config
    }
    
    private let adjacentStationButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("인접역 표출, SR 연계 표출", attributes: container)
        config.image = ImageLiterals.icCheck
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 9
        $0.configuration = config
        
    }
    
    private lazy var ticketInfoFormStackView = UIStackView(
        arrangedSubviews: [dateStackView, numberOfPeopleButton, adjacentStationButton]
    ).then {
        $0.axis = .vertical
        $0.spacing = 9
        $0.distribution = .fillEqually
    }
    
    private lazy var trainSearchButton = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 20)
        config.attributedTitle = AttributedString("열차 조회", attributes: container)
        config.baseBackgroundColor = .korailPrimaryColor
        config.baseForegroundColor = .white
        config.background.cornerRadius = 10
        $0.configuration = config
        $0.addTarget(self, action: #selector(touchUpTrainSearchButton), for: .touchUpInside)
    }
    
    private func pushtoTrainInquiryVC() {
        let trainInquiryVC = TrainInquiryVC()
        self.navigationController?.pushViewController(trainInquiryVC, animated: true)
    }
    
    @objc
    private func touchUpTrainSearchButton() {
        pushtoTrainInquiryVC()
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUI()
        setLayout()
        setAction()
        getTrailLocationData()
    }
    
    
    
    
    private func presentToInfoVC(){
        let InfoVC = InfoFormVC()
        InfoVC.modalPresentationStyle = .formSheet
        self.present(InfoVC,animated: true,completion: nil)
    }
    
    // MARK: - objc touchupSignUpButton func
    @objc
    private func touchupDepartureDateButton(){
        presentToInfoVC()
    }

    
    
}

// MARK: - Methods

extension LocationFormVC {
    
    private func setNavigationBar() {
        self.navigationItem.title = "승차권 예매"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: FontName.pretendardMedium.rawValue, size: 20), size: 20)]
    }
    
    private func setUI() {
        view.backgroundColor = .korailGray1
    }
    
    private func setLayout() {
        view.addSubviews(contentView, trainSearchButton)
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(17)
        }
        
        contentView.addSubviews(
            roundTripTicketButton,
            singleTripTicketButton,
            dividerView ,
            locationConfigureStackView,
            ticketInfoFormStackView
        )
        
        roundTripTicketButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.leading.equalToSuperview().inset(75)
            make.width.equalTo(58)
            make.height.equalTo(38)
        }
        
        singleTripTicketButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.trailing.equalToSuperview().inset(75)
            make.width.equalTo(58)
            make.height.equalTo(38)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(roundTripTicketButton.snp.bottom).offset(11)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(0.5)
        }
        
        locationConfigureStackView.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(34)
            make.centerX.equalToSuperview()
        }
        
        ticketInfoFormStackView.snp.makeConstraints { make in
            make.top.equalTo(locationConfigureStackView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(19)
            make.bottom.equalToSuperview().inset(28)
            make.height.equalTo(174)
        }
        
        trainSearchButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(28)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(17)
            make.height.equalTo(48)
        }
    }
    
    private func setAction() {
        [roundTripTicketButton, singleTripTicketButton].forEach({ button in
            button.addTarget(self, action: #selector(ticketScheduleButtonDidTap(sender: )), for: .touchUpInside)
        })
    }
    
    private func setData(data: TrailLocationResponseData) {
        departureCityButton.titleLabel?.text = data.departures
        arrivalCityButton.titleLabel?.text = data.arrivals
        departureDateButton.setTitle(data.startDate, for: .normal)
        arrivalDateButton.setTitle(data.lastDate, for: .normal)
        numberOfPeopleButton.titleLabel?.text = "성인 \(data.personnel)명"
    }
    
    // MARK: - @objc Function
    
    @objc private func ticketScheduleButtonDidTap(sender: UIButton) {
        guard sender.isSelected != true else { return }
        
        sender.isSelected.toggle()
        
        sender.backgroundColor = sender.isSelected ? UIColor.korailPrimaryColor : UIColor.white
        
        if sender == singleTripTicketButton {
            roundTripTicketButton.isSelected = false
            roundTripTicketButton.backgroundColor = roundTripTicketButton.isSelected ? UIColor.korailPrimaryColor : UIColor.white
        } else {
            singleTripTicketButton.isSelected = false
            singleTripTicketButton.backgroundColor = singleTripTicketButton.isSelected ? UIColor.korailPrimaryColor : UIColor.white
        }
    }
}


// MARK: - Network

extension LocationFormVC {
    private func getTrailLocationData() {
        trailProvider.request(.getTrailLocation) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status < 300 {
                    do {
                        let responseDto = try result.map(TrailLocationResponseDto.self)
                        self.setData(data: responseDto.data[0])
                    }
                    catch(let error) {
                        print(error.localizedDescription)
                    }
                }
                if status >= 400 {
                    print("400 error")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
