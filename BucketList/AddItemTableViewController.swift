//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by Danny on 10/13/21.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    
    weak var delegate: AddItemTableViewControllerDelegate? // we make a delegate variable that has a data type of AddItemTableViewControllerDelegate
    var item: String?
    var indexPath: IndexPath?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    
    /*
        REMINDER!!: A DELEGATE HAS A SENDER AND A RECEIVER.
        Who is the sender?
            AddItemTableViewController
        Who is the receiver?
            BucketListViewController
    */
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        delegate?.cancelButtonPressed(by: self) // Tells delegate to start calling the cancelButtonPressed() function from AddItemTableViewControllerDelegate
    }
    
    /*
        REMINDER!!: A DELEGATE HAS A SENDER AND A RECEIVER.
        Who is the sender?
            AddItemTableViewController
        Who is the receiver?
            BucketListViewController
    */
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath) // Tells delegate to start calling the itemSaved() function from AddItemTableViewControllerDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item
    }

}
