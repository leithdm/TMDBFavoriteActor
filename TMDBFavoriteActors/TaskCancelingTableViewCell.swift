//
//  ImageFetchingTableViewCell.swift
//  FavoriteActors
//
//

import UIKit

class TaskCancelingTableViewCell : UITableViewCell {

    // The property uses a property observer. Any time its
    // value is set it canceles the previous NSURLSessionTask
    
    var imageName: String = ""
    
    var taskToCancelifCellIsReused: NSURLSessionTask? {

        didSet {
            if let taskToCancel = oldValue {
                taskToCancel.cancel()
            }
        }
    }
}
