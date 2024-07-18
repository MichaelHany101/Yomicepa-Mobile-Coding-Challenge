//
//  PharmaciesListTableViewCell.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import UIKit

class PharmaciesListTableViewCell: UITableViewCell {

    @IBOutlet weak var pharmaciesName: UILabel!
    @IBOutlet weak var pharmaciesReturn: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setName(name : String) {
        self.pharmaciesName.text = name
    }
    
    func setReturn(returnString : String) {
        self.pharmaciesReturn.text = returnString
    }
}
