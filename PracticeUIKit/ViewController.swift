//
//  ViewController.swift
//  PracticeUIKit
//
//  Created by dddiehard on 16/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableVieww: UITableView!
    
    var jokesList: [JokeModel] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableVieww.register(.init(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        CustomNotificationCenter.observeNotification(self, selector: #selector(refreshTable), name: "refreshTable")
                
        fetchJokes(refreshControl: nil)
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .orange
        refreshControl.addTarget(self, action: #selector(fetchJokes), for: .valueChanged)
        
        tableVieww.refreshControl = refreshControl
                                                        
        tableVieww.dataSource = self
        tableVieww.delegate = self
        
        tableVieww.separatorStyle = .singleLine
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return jokesList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 300))
        view.backgroundColor = .systemGray6
        
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 50))
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.text = jokesList[section].id
        lbl.textColor = .black
        view.addSubview(lbl)
        return view
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected", indexPath.section)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        if let cell {
            
            cell.loadCell(cellText:  jokesList[indexPath.section].jokeValue)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

