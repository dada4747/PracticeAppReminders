//
//  ViewController.swift
//  PracticeAppReminders
//
//  Created by admin on 11/06/22.
//

import UIKit

class ViewController: UIViewController {
   
//
//    lazy var addButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(addTapped))
//    lazy var doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(addTapped))
    var isDoneButton = true
    lazy var plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTapped))
    let tableView = UITableView()
    let plustIcon : UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "plus"), for: .normal)
        b.tintColor = .systemYellow
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
      print("++++++++++++++++++++")
        configureNav()
        configureTableView()
//        plustIcon.addAction(methodddd("rahul", _str2: "adsure").self, for: .touchUpInside)// addTarget(self, action:methodddd("rahul", _str2:"adsure"), for: .touchUpInside)

    }
     @objc func methodddd(_ str1: String, _str2: String){
        print(str1)
        
    }
    func configureNav(){
        navigationItem.leftBarButtonItem = editButtonItem()
        //editButtonItem.action = addTapped()//addButton
        navigationItem.rightBarButtonItem = plusButton
        navigationItem.title = "Alarm"
        navigationController?.navigationBar.tintColor = .systemYellow
//        navigationItem
    }
     func editButtonItem() -> UIBarButtonItem {
        let editButton = super.editButtonItem
         editButton.action = #selector(editButtonAction(sender:))
           return editButton
      }

    @objc func editButtonAction(sender: UIBarButtonItem) {
          if self.tableView.isEditing == true {
              self.tableView.isEditing = false
              self.isDoneButton = !isDoneButton
              sender.style = UIBarButtonItem.Style.plain
                sender.title = "Edit"
           } else {
               self.tableView.isEditing = true
               self.isDoneButton = !isDoneButton
               sender.style = UIBarButtonItem.Style.done
                sender.title = "Done"
           }
      }

    @objc func addTapped(){    }
    func configureTableView(){
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 100
        tableView.allowsSelectionDuringEditing = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    let switchMode: UISwitch = {
        let switchmode = UISwitch()
        return switchmode
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    let count = 4
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.reloadData()
    }
}

extension ViewController :  UITableViewDelegate, UITableViewDataSource {
 
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isDoneButton {
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        }
        else {
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "celll")
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        }
        cell!.selectionStyle = .none
        cell!.tag = indexPath.row
        let amAttr: [NSAttributedString.Key : Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 20.0)]
        let str = NSMutableAttributedString(string: "10:30", attributes: amAttr)
        let timeAttr: [NSAttributedString.Key : Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 45.0)]
        str.addAttributes(timeAttr, range: NSMakeRange(0, str.length-2))
        cell!.shouldIndentWhileEditing = false
        cell!.textLabel?.attributedText = str
        cell!.detailTextLabel?.text = "5678"
        cell!.textLabel?.attributedText = str
        cell!.detailTextLabel?.text = "label"
        let sw = UISwitch(frame: CGRect())
        sw.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
        sw.tag = indexPath.row
        let se = UIButton(frame: CGRect())
        se.backgroundColor = .blue
        se.setTitle("titie", for: .normal)
        se.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
//        sw.addTarget(self, action: #selector(MainAlarmViewController.switchTapped(_:)), for: UIControlEvents.valueChanged)
        if isDoneButton {
            cell!.backgroundColor = UIColor.white
            cell!.textLabel?.alpha = 1.0
            cell!.detailTextLabel?.alpha = 1.0
            sw.setOn(true, animated: false)
        } else {
            cell!.backgroundColor = UIColor.groupTableViewBackground
            cell!.textLabel?.alpha = 0.5
            cell!.detailTextLabel?.alpha = 0.5
        }
        cell!.accessoryView = sw
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        cell!.editingAccessoryType = .disclosureIndicator
        return cell!
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = indexPath.row
            let cells = tableView.visibleCells
            for cell in cells {
                let sw = cell.accessoryView as! UISwitch
                if sw.tag > index {
                    sw.tag -= 1
                }
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
//    public func changeSwitchButtonState(index: Int) {
//
//        let cells = tableView.visibleCells
//        for cell in cells {
//            if cell.tag == index {
//                let sw = cell.accessoryView as! UISwitch
//                    sw.setOn(false, animated: false)
//                    cell.backgroundColor = UIColor.groupTableViewBackground
//                    cell.textLabel?.alpha = 0.5
//                    cell.detailTextLabel?.alpha = 0.5
//            }
//        }
//    }
    
}
