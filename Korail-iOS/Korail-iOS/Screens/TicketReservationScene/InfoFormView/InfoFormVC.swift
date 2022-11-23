//
//  InfoFormVC.swift
//  Korail-iOS
//
//  Created by 누리링 on 2022/11/23.
//


import UIKit
import FSCalendar
import SnapKit
import SwiftyColor
import Then

class InfoFormVC: UIViewController {
    
    var calendarView = FSCalendar()
    
    
    private lazy var infoFormView: UITableView = {
        let infoFormView = UITableView()
        infoFormView.backgroundColor = .clear
        infoFormView.translatesAutoresizingMaskIntoConstraints = false
        infoFormView.separatorStyle = .singleLine
        infoFormView.separatorColor = .clear
        infoFormView.delegate = self
        infoFormView.dataSource = self
        return infoFormView
    }()
    
    private let ticketLabel = UILabel().then{
        $0.text = "승차권 예매"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    
    
    private let bigLeft = UIButton().then{
        $0.setImage(UIImage(named: "ic_bigleft"), for: .normal)
    }


    private let userLabel = UILabel().then{
        $0.text = "인원 선택"
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .korailGray1
        calendarView.delegate = self
        calendarView.dataSource = self
        setlayout()
        register()

    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendarView.frame = CGRect(x: 20, y:130, width: 350, height: 300)
        view.addSubview(calendarView)
        
        
        calendarView.placeholderType = .none
        calendarView.scrollEnabled = false
        calendarView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        calendarView.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        calendarView.appearance.todayColor = UIColor(red: 198/255, green: 224/255, blue: 253/255, alpha: 1)
        
        calendarView.appearance.headerTitleFont = UIFont(name: "Pretendard-Medium", size: 15)
        calendarView.appearance.weekdayFont = UIFont(name: "Pretendard-Regular", size: 16)
        calendarView.appearance.titleFont = UIFont(name: "Pretendard-Regular", size: 13)
        
        calendarView.firstWeekday = 2

        calendarView.appearance.headerDateFormat = "< M월 >"
        calendarView.appearance.headerTitleColor = .black

        // 달력의 요일 글자 바꾸는 방법
        calendarView.calendarWeekdayView.weekdayLabels[0].text = "월"
        calendarView.calendarWeekdayView.weekdayLabels[1].text = "화"
        calendarView.calendarWeekdayView.weekdayLabels[2].text = "수"
        calendarView.calendarWeekdayView.weekdayLabels[3].text = "목"
        calendarView.calendarWeekdayView.weekdayLabels[4].text = "금"
        calendarView.calendarWeekdayView.weekdayLabels[5].text = "토"
        calendarView.calendarWeekdayView.weekdayLabels[6].text = "일"
        calendarView.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        
        // 달력의 평일 날짜 색깔
          calendarView.appearance.titleDefaultColor = .black
          // 달력의 토,일 날짜 색깔
          calendarView.appearance.titleWeekendColor = .red
        
          // 달력의 요일 글자 색깔
          calendarView.appearance.weekdayTextColor = .black
        
        calendarView.calendarWeekdayView.weekdayLabels.last!.textColor = .red
    
    }

    

        var infoList: [InfoModel] = [
        InfoModel(infoName: "어른", infoDescription: "만 13세 이상", plusDescription: "", btnMius: "ic_minus", peopleNum: "1", btnPlus: "ic_plus"),
        InfoModel(infoName: "어린이", infoDescription: "만 6~12세", plusDescription: "", btnMius: "ic_minus", peopleNum: "0", btnPlus: "ic_plus"),
        InfoModel(infoName: "유아", infoDescription: "만 6세 미만", plusDescription: "ic_info", btnMius: "ic_minus", peopleNum: "1", btnPlus: "ic_plus"),
        InfoModel(infoName: "경로", infoDescription: "만 65세 이상", plusDescription: "", btnMius: "ic_minus", peopleNum: "0", btnPlus: "ic_plus"),
        InfoModel(infoName: "중증장애인", infoDescription: "", plusDescription: "ic_info", btnMius: "ic_minus", peopleNum: "1", btnPlus: "ic_plus"),
        InfoModel(infoName: "경증장애인", infoDescription: "", plusDescription: "ic_plus", btnMius: "ic_minus", peopleNum: "1", btnPlus: "ic_plus"),
    
    ]

    
}



extension InfoFormVC {
    
    private func setlayout() {
        
        [ticketLabel, bigLeft, userLabel].forEach{view.addSubview($0)
            
        }
        
        
        ticketLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(94)
            $0.leading.equalToSuperview().offset(139)
            $0.trailing.equalToSuperview().offset(-138)
            $0.height.equalTo(21)
        }
        
        
        bigLeft.snp.makeConstraints {
            $0.top.equalToSuperview().offset(89)
            $0.trailing.equalTo(self.ticketLabel.snp.trailing).inset(220)
            $0.width.equalTo(15)
            $0.height.equalTo(30)

        }
        
        
        userLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(450)
            $0.leading.equalToSuperview().offset(13)
            $0.width.equalTo(70)
            $0.height.equalTo(30)

        }
        
    
        
    }
    
    
    private func register() {
        infoFormView.register(PeopleInfoTableViewCell.self, forCellReuseIdentifier: PeopleInfoTableViewCell.identifier)
    }
}



extension InfoFormVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = infoFormView.dequeueReusableCell(withIdentifier: PeopleInfoTableViewCell.identifier, for: indexPath) as? PeopleInfoTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
}

extension InfoFormVC: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
    
    
    // 토요일 파랑, 일요일 빨강으로 만들기
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let day = Calendar.current.component(.weekday, from: date) - 1
        
        if Calendar.current.shortWeekdaySymbols[day] == "일" {
            return .systemRed
        }
        return .label
    }
    
    //날짜 밑에 문자열을 표시
    //            func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
    //                let dateFormatter = DateFormatter()
    //                switch dateFormatter.string(from: date) {
    //                case dateFormatter.string(from: Date()):
    //                    return "오늘"
    //                default:
    //                    return nil
    //                }
    //            }
    //
    
}
