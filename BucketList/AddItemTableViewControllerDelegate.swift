//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by Danny on 10/13/21.
//

import Foundation
import UIKit

/*
    What is a protocol?
    Protocols are used to define a “blueprint of methods/functions, properties that is used to accomplish a particular task"
    Protocols only have the function keyword and the function name
    Protocols DO NOT have function body.
        They do not have these symbols in the functions "{  }"
    
    
    In this assignment. BucketListViewController is inheriting from AddItemTableViewControllerDelegate.
    So we must implement the functions in BucketListViewController.
 
    Why?
        Well, think of protocols as a CONTRACT.
        Any class that is inheriting from AddItemTableViewControllerdelegate must implement all of its functions
 
 
 
    In this example we have 2 functions
    The first function is when the cancel button is pressed
        cancelButtonPressed() function passes 1 parameter -> AddItemTableViewController
    The second function is when an item is saved.
        itemSaved() function passes 3 parameters -> AddItemTableViewController, text, and IndexPath
 
    REMINDER!!: These parameters gets passed around during the DELEGATION phase.
 
*/
protocol  AddItemTableViewControllerDelegate: class {
    func cancelButtonPressed(by controller: AddItemTableViewController)
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: IndexPath?)
}
