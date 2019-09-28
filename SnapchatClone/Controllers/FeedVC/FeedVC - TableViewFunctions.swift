//
//  FeedVC - TableViewFunctions.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/18/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /* PART 2B START */
        return arrayOfSnaps.count
        /* PART 2B FINISH */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath[1]
        // look at DateFormatter documentation to figure out how to convert a SnapImage.timeSent to a label's text
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath)
            as! FeedTableViewCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        /* PART 2C START */
        cell.awakeFromNib()
        let snap = arrayOfSnaps[index]
        cell.senderLabel.text = snap.sender
        cell.dateSentLabel.text = formatter.string(from: snap.timeSent)
        for snap in arrayOfSnaps {
            print("in cell for row, snap name and open" + snap.sender + String(snap.opened));
        }
        if snap.opened {
   //         cell.hasBeenOpenedSquare.layer.backgroundColor = UIColor.clear.cgColor
            cell.hasBeenOpenedSquare.layer.borderColor = UIColor.red.cgColor
        } else {
            cell.hasBeenOpenedSquare.layer.backgroundColor = UIColor.red.cgColor
        }
        /* PART 2C FINISH*/
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var index = indexPath[1]
        /* PART 2D START */
        var snap = arrayOfSnaps[index]
        if (!snap.opened){
            snap.opened = true;
            print("snap name and open" + snap.sender + String(snap.opened));
            var snapImage = SnapImage.init(sentBy: snap.sender, sentTo: snap.sentTo, timeSent: snap.timeSent, image: snap.image)
            selectedImage = snapImage
        
            performSegue(withIdentifier: "toShowImage", sender: self)
        }
        /* PART 2D FINISH */
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
