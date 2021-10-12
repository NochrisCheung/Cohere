//
//  DayPickerCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 08/10/2021.
//

import UIKit


class DayPickerCell: UITableViewCell {
        
    static let identifier = Constants.dayPickerCellIdentifier
    
    var dayPickerTextLabel: UILabel! = {
        let dayPickerTextLabel = UILabel()
        return dayPickerTextLabel
    }()
    
    var dateTextField: UITextField! = {
        let dateTextField = UITextField()
        return dateTextField
    }()
    
    var timeTextField: UITextField! = {
        let timeTextField = UITextField()
        return timeTextField
    }()
    
    lazy var datePicker : UIDatePicker! = {
        let datePicker = UIDatePicker()
        return datePicker
    }()
    
    lazy var timePicker : UIDatePicker! = {
        let timePicker = UIDatePicker()
        return timePicker
    }()

    var selectedDateTime: Date?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Create DayPickerCell")
        selectionStyle = .none

        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        print("Set up view")
        
        contentView.addSubview(dayPickerTextLabel)
        contentView.addSubview(dateTextField)
        contentView.addSubview(timeTextField)

        configureDayPickerTextLabel()
        configureDateTextField()
        configureTimeTextField()
        configureDatePicker()
        configureTimePicker()
        
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureDayPickerTextLabel() {
//        dayPickerTextLabel.textColor = UIColor.systemOrange
//        dayPickerTextLabel.text = "Start Time"

        dayPickerTextLabel.translatesAutoresizingMaskIntoConstraints = false
        dayPickerTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 15).isActive = true
        dayPickerTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    func configureDateTextField() {
        dateTextField.textColor = UIColor.systemOrange
//        dateTextField.backgroundColor = UIColor.darkGray

        dateTextField.placeholder = "Date"
        dateTextField.inputView = datePicker

        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.trailingAnchor.constraint(equalTo: timeTextField.leadingAnchor , constant: -30).isActive = true
        dateTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    func configureTimeTextField() {

       timeTextField.textColor = UIColor.systemOrange
//       timeTextField.backgroundColor = UIColor.lightGray

       timeTextField.placeholder = "Time"
       timeTextField.inputView = timePicker
        
       timeTextField.translatesAutoresizingMaskIntoConstraints = false
       timeTextField.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -30).isActive = true
       timeTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
   }

    func configureDatePicker() {
//        datePicker.centerYAnchor.constraint(equalTo: dateTextField.centerYAnchor).isActive = true
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = Constants.Color.backgroundColor
        datePicker.minimumDate = Date()
        
        datePicker.addTarget(self, action: #selector(pickerHandler), for: UIControl.Event.valueChanged)
        

    }

    func configureTimePicker() {
//        timePicker.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.backgroundColor = Constants.Color.backgroundColor
        timePicker.minuteInterval = 15
        
        timePicker.addTarget(self, action: #selector(pickerHandler), for: UIControl.Event.valueChanged)
    }
}
// MARK: Handler methods
extension DayPickerCell {
    
    @objc func pickerHandler(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()

        if sender == datePicker {
            timeFormatter.dateFormat = "dd MMM yy"
            dateTextField.text = timeFormatter.string(from: sender.date)
        } else {
            timeFormatter.dateFormat = "HH:mm"
            timeTextField.text = timeFormatter.string(from: sender.date)
        }
        
        selectedDateTime = sender.date
        print("\(selectedDateTime)")
    }
}
