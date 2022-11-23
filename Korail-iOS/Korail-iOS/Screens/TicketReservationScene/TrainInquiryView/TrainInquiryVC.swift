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
    
    private var selectedIndex: IndexPath?
    
    private let departArrivalView = UIView()
    private let topView = UIView()
    private let middleView = UIView()
    private let trainInquiryIndexView = UIView()
    private let bottomView = UIView()

    
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
        $0.tintColor = .black
    }
    
    private let nextDateArrowButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.icBigRight, for: .normal)
        $0.tintColor = .black
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
        config.image = ImageLiterals.icDrop.withTintColor(.korailGray2)
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 52
        config.imagePlacement = .trailing
        $0.configuration = config
    }
    
    private let selectOptionButton2 = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("일반석", attributes: container)
        config.image = ImageLiterals.icDrop.withTintColor(.korailGray2)
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePlacement = .trailing
        config.imagePadding = 35
        $0.configuration = config
    }
    
    private let selectOptionButton3 = UIButton().then {
        var config = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.font(.pretendardMedium, ofSize: 16)
        config.attributedTitle = AttributedString("직통", attributes: container)
        config.image = ImageLiterals.icDrop.withTintColor(.korailGray2)
        config.baseBackgroundColor = .korailGray1
        config.baseForegroundColor = .korailGray2
        config.imagePadding = 15
        config.imagePlacement = .trailing

        $0.configuration = config
    }
    
    private let trainIndexLabel = UILabel().then {
        $0.text = "열차"
        $0.textColor = .korailGray2
        $0.font = UIFont.font(.pretendardRegular, ofSize: 12)
    }
    
    private let departureIndexLabel = UILabel().then {
        $0.text = "출발"
        $0.textColor = .korailGray2
        $0.font = UIFont.font(.pretendardRegular, ofSize: 12)
    }
    
    private let arrivalIndexLabel = UILabel().then {
        $0.text = "도착"
        $0.textColor = .korailGray2
        $0.font = UIFont.font(.pretendardRegular, ofSize: 12)
    }
    
    private let standardRoomInfoIndexLabel = UILabel().then {
        $0.text = "일반실"
        $0.textColor = .korailGray2
        $0.font = UIFont.font(.pretendardRegular, ofSize: 12)
    }
    
    private let suiteRoomInfoIndexLabel = UILabel().then {
        $0.text = "특/우등"
        $0.textColor = .korailGray2
        $0.font = UIFont.font(.pretendardRegular, ofSize: 12)
    }
    
    private lazy var trainInquiryTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .singleLine
        $0.separatorColor = .clear
        $0.delegate = self
        $0.dataSource = self
    }
    
    var trainInquiryList: [TrainInquiryModel] = [
        TrainInquiryModel(train: "무1314", departure: "06:39", arrival: "08:01", standardRoomInfo: "7,800₩", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1316", departure: "06:57", arrival: "08:31", standardRoomInfo: "7,800₩", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1318", departure: "07:10", arrival: "08:40", standardRoomInfo: "7,800₩", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1442", departure: "07:40", arrival: "09:20", standardRoomInfo: "매진", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1318", departure: "08:32", arrival: "09:58", standardRoomInfo: "매진", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1505", departure: "09:10", arrival: "10:40", standardRoomInfo: "7,800₩", suiteRoomInfo: "11,800₩"),
        TrainInquiryModel(train: "무1314", departure: "06:39", arrival: "08:01", standardRoomInfo: "7,800₩", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1316", departure: "06:57", arrival: "08:31", standardRoomInfo: "7,800₩", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1318", departure: "07:10", arrival: "08:40", standardRoomInfo: "7,800₩", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1442", departure: "07:40", arrival: "09:20", standardRoomInfo: "매진", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1318", departure: "08:32", arrival: "09:58", standardRoomInfo: "매진", suiteRoomInfo: "-"),
        TrainInquiryModel(train: "무1505", departure: "09:10", arrival: "10:40", standardRoomInfo: "7,800₩", suiteRoomInfo: "11,800₩")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
        setNavigationBar()
        register()
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
            $0.bottom.equalToSuperview()
        }
        
        contentView.addSubviews(
            departArrivalView,
            topView,
            middleView,
            trainInquiryIndexView,
            bottomView
        )
        
        //topView.backgroundColor = .red
        
        departArrivalView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(22)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(97)
            $0.height.equalTo(21)
        }
        
        departArrivalView.addSubviews(
            departureLabel,
            rightArrowImageView,
            arrivalLabel
        )
        
        rightArrowImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(12)
            $0.height.equalTo(7)
        }
        
        departureLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        
        arrivalLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
        }
        
        topView.addSubviews(
            previousDateArrowButton,
            nextDateArrowButton,
            selectedDateLabel
        )
        
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
            $0.top.equalTo(contentView.snp.top).offset(72)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(4.84)
            $0.height.equalTo(11.29)
        }
        
        nextDateArrowButton.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(72)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(4.84)
            $0.height.equalTo(11.29)
        }
        
        //middleView.backgroundColor = .orange
        
        middleView.addSubviews(
            selectOptionButton1,
            selectOptionButton2,
            selectOptionButton3
        )
        
        middleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(43)
        }
        
        selectOptionButton1.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
            $0.height.equalToSuperview()
            $0.width.equalTo(118)
        }
        
        selectOptionButton2.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(selectOptionButton1.snp.trailing).offset(6)
            $0.height.equalToSuperview()
            $0.width.equalTo(118)
        }
        
        selectOptionButton3.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(13)
            $0.height.equalToSuperview()
            $0.width.equalTo(83)
        }
        
        //trainInquiryIndexView.backgroundColor = .yellow
        
        trainInquiryIndexView.addSubviews(
            trainIndexLabel,
            departureIndexLabel,
            arrivalIndexLabel,
            standardRoomInfoIndexLabel,
            suiteRoomInfoIndexLabel
        )
        
        trainInquiryIndexView.snp.makeConstraints {
            $0.top.equalTo(middleView.snp.bottom)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(59)
        }
        
        trainIndexLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(27)
        }
        
        departureIndexLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(trainIndexLabel.snp.trailing).offset(44)
        }
        
        arrivalIndexLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(departureIndexLabel.snp.trailing).offset(39)
        }
        
        suiteRoomInfoIndexLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(27)
        }
        
        standardRoomInfoIndexLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalTo(suiteRoomInfoIndexLabel.snp.leading).offset(-43)
        }
        
        //bottomView.backgroundColor = .green
        
        bottomView.addSubview(trainInquiryTableView)
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(trainInquiryIndexView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        trainInquiryTableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(67 * trainInquiryList.count)
        }
        
    }
    
    private func register() {
        trainInquiryTableView.register(TrainInquiryViewCell.self, forCellReuseIdentifier: TrainInquiryViewCell.identifier)
    }
    
    
    
}

extension TrainInquiryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67
    }
}

extension TrainInquiryVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainInquiryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let trainInquiryCell = tableView.dequeueReusableCell(withIdentifier: TrainInquiryViewCell.identifier, for: indexPath)
                as? TrainInquiryViewCell else {return UITableViewCell()}
        trainInquiryCell.selectionStyle = .none
        trainInquiryCell.dataBind(model: trainInquiryList[indexPath.row])
        return trainInquiryCell
        
    }
}

extension TrainInquiryVC {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! TrainInquiryViewCell
        
        if let selectedIndex = selectedIndex {
            let previousCell = tableView.cellForRow(at: selectedIndex)
            
            previousCell?.backgroundColor = .white

        }

        selectedIndex = indexPath
        selectedCell.backgroundColor = .korailGray1
    }
    
}
