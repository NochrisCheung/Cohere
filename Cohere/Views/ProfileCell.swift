//
//  ProfileCell.swift
//  Cohere
//
//  Created by Chiu Wing Cheung on 06/10/2021.
//

import UIKit
import Firebase

protocol ProfileCellSelectionDelegate {
    func popToRootView()
    
}


class ProfileCell: UITableViewCell {

    var selectionDelegate: ProfileCellSelectionDelegate!
    
    @IBOutlet weak var cellButton: UIButton!
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        if self.cellButton?.title = K.Button.LogOutButton.title {
        if sender.title(for: .normal) == K.Button.LogOutButton.title {
            // Pop to Root View When Log Out Button Is Pressed
            selectionDelegate?.popToRootView()
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

//    }

        // Configure the view for the selected state
    }
    
}
