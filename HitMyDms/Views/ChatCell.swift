//
//  ChatCell.swift
//  HitMyDms
//
//  Created by Kymberlee Hill on 2/24/18.
//  Copyright © 2018 Kymberlee Hill. All rights reserved.
//

import UIKit
import Parse

class ChatCell: UITableViewCell, UITableViewDataSource, UITextFieldDelegate {
    
   
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var messages: PFObject! {
        didSet {
            messageLabel.text = messages.object(forKey: "text") as? String
            
            //let username = messages.object(forKey: "user")
            let user = messages.object(forKey: "user") as? PFUser
            if (user != nil) {
                // set username
                
                var username = user?.username
                
                userLabel.text = username
                
                let fullUsername = username?.replacingOccurrences(of: " ", with: "_")
                
                // set avatar
                if let username = fullUsername {
                    do {
                        let imageURL = URL(string: "http://api.adorable.io/avatar/200/\(username)")
                        
                        avatarImageView.af_setImage(withURL: imageURL!)
                    } catch {
                        let imageURL = URL(string: "http://api.adorable.io/avatar/200/random")!
                        avatarImageView.af_setImage(withURL: imageURL)
                    }
                }
            }
            else {
                userLabel.text = "unknown"
                let imageURL = URL(string: "http://api.adorable.io/avatar/200/unknown)")
                
                avatarImageView.af_setImage(withURL: imageURL!)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
