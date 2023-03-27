//
//  ProjectCell.swift
//  Compilation
//
//  Created by Sferea-Lider on 27/03/23.
//

import UIKit

class ProjectCell: UITableViewCell {

    @IBOutlet weak var nameProjectLbl: UILabel!
    
    static let identifier = "ProjectCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
