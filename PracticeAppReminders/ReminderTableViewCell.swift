//
//  ReminderTableViewCell.swift
//  PracticeAppReminders
//
//  Created by admin on 11/06/22.
//

import UIKit
protocol ChangeConstraintsProtocol{
    func changeContraints()
}
class ReminderTableViewCell: UITableViewCell {
//    var isChange : Bool = false {
//        willSet {
//              configureAppearaneSwitch(newValue)
//                configureArrow(!newValue)
//        }}

    
    let label : UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.font = UIFont.systemFont(ofSize: 50)
        return l
    }()
    let descLabel : UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
    let switchMode: UISwitch = {
        let switchmode = UISwitch()
        return switchmode
    }()
    let arrowButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        return b
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
//        configureArrow(<#Bool#>)
//        configureAppearaneSwitch(<#Bool#>)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(time: String , description: String) {
        self.label.text = time
        self.descLabel.text = description
    }
   
    func configure(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 60),
            label.widthAnchor.constraint(equalToConstant: 150)
        ])
        addSubview(descLabel)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            descLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            descLabel.heightAnchor.constraint(equalToConstant: 20),
            descLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
     var nsArrow : [NSLayoutConstraint]!
     var nsSwich : [NSLayoutConstraint]!

    func configureAppearaneSwitch(_ isChange: Bool) {
        print("configureAppearaneSwitch")
        print(isChange)
       
        addSubview(switchMode)
        switchMode.translatesAutoresizingMaskIntoConstraints = !isChange
        nsSwich = [
            switchMode.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30) ,
            switchMode.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30) ,
            switchMode.widthAnchor.constraint(equalToConstant: 50) ,
            switchMode.heightAnchor.constraint(equalToConstant: 40) ,
            switchMode.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)

        ]
        for i in nsSwich {
            i.isActive = isChange
        }
        
        arrowButton.translatesAutoresizingMaskIntoConstraints = isChange
        addSubview(arrowButton)
            nsArrow = [
                arrowButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
                arrowButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30),
                arrowButton.widthAnchor.constraint(equalToConstant: 50),
                arrowButton.heightAnchor.constraint(equalToConstant: 40),
                arrowButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
            ]
            for i in nsArrow {
                i.isActive = !isChange
            }

        
    }
    

//    func configureArrow(_ isChange: Bool){
//        print("configurearraow clal")
//        print(isChange)
//        arrowButton.translatesAutoresizingMaskIntoConstraints = !isChange
//        addSubview(arrowButton)
//            nsArrow = [
//                arrowButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
//                arrowButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30),
//                arrowButton.widthAnchor.constraint(equalToConstant: 50),
//                arrowButton.heightAnchor.constraint(equalToConstant: 40),
//                arrowButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
//            ]
//            for i in nsArrow {
//                i.isActive = isChange
//            }
//
//
//
//    }
//                
        
        
      
    
}

class ReminderTableViewCell2: UITableViewCell {
    let label : UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.font = UIFont.systemFont(ofSize: 50)
        return l
    }()
    let descLabel : UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
    let switchMode: UISwitch = {
        let switchmode = UISwitch()
        return switchmode
    }()
    let arrowButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        return b
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureArrow()
//        configureAppearaneSwitch()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(time: String , description: String) {
        self.label.text = time
        self.descLabel.text = description
    }
    
    
    
    var nsa : [NSLayoutConstraint]!

    func configureArrow(){
        addSubview(arrowButton)
            ns = [
                arrowButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
                arrowButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30),
                arrowButton.widthAnchor.constraint(equalToConstant: 50),
                arrowButton.heightAnchor.constraint(equalToConstant: 40),
                arrowButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
            ]
//            arrowButton.translatesAutoresizingMaskIntoConstraints = false
            for i in ns {
                i.isActive = true
            }



    }
    func configure(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.heightAnchor.constraint(equalToConstant: 60),
            label.widthAnchor.constraint(equalToConstant: 150)
        ])
        addSubview(descLabel)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            descLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            descLabel.heightAnchor.constraint(equalToConstant: 20),
            descLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    var ns : [NSLayoutConstraint]!

//    func configureAppearaneSwitch() {
//        addSubview(switchMode)
//        switchMode.translatesAutoresizingMaskIntoConstraints = false
//        ns = [
//            switchMode.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30) ,
//            switchMode.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30) ,
//            switchMode.widthAnchor.constraint(equalToConstant: 50) ,
//            switchMode.heightAnchor.constraint(equalToConstant: 40) ,
//            switchMode.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
//
//        ]
//        for i in ns {
//            i.isActive = true
//        }
//    }
//                
        
        
      
    
}
