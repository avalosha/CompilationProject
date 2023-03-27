//
//  ViewController.swift
//  Compilation
//
//  Created by Sferea-Lider on 27/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var projectTableView: UITableView!
    
    let projects: [String] = ["Project 0"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    deinit {
        NSLog ("ViewController deinit called")
    }

    private func setupTableView() {
        projectTableView.delegate = self
        projectTableView.dataSource = self
        projectTableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCell.identifier) as! ProjectCell
        let data = projects[indexPath.row]
        cell.nameProjectLbl.text = data
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select: ",indexPath.row)
    }
}
