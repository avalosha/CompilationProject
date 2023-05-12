//
//  ViewController.swift
//  Compilation
//
//  Created by Sferea-Lider on 27/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var projectTableView: UITableView!
    
    let projects: [String] = ["Open Whatsapp"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTableView()
    }
    
    deinit {
        NSLog ("ViewController deinit called")
    }
    
    private func setupTitle() {
#if DEV_COMPILATION
      descriptionLbl.text = "This is a Development Environment"
#elseif TEST_COMPILATION
      descriptionLbl.text = "This is a Test Environment"
#else
      descriptionLbl.text = "This is a Production Environment"
#endif
    }

    private func setupTableView() {
        projectTableView.delegate = self
        projectTableView.dataSource = self
        projectTableView.reloadData()
    }
    
    private func openVC(with index: Int) {
        switch index {
        case 0:
            if let vc = ContactBookViewController.newInstance(){
                self.navigationController?.pushViewController(vc, animated: true)
            }
            break
        default:
            break
        }
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
        openVC(with: indexPath.row)
    }
}
