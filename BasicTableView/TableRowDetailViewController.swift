//
//  TableRowDetailViewController.swift
//  BasicTableView
//
//  Created by Shane O'Mahony on 07/11/2018.
//  Copyright © 2018 Shane O'Mahony. All rights reserved.
//

import UIKit

class TableRowDetailViewController: UIViewController {

    @IBOutlet weak var entryTitleField: UITextField!
    @IBOutlet weak var entryDescriptionField: UITextField!
    
    var itemToDisplay: DataSource.TableRowEntry? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let newItem = itemToDisplay else {
            return
        }
        
        entryTitleField.text? = newItem.title
        entryDescriptionField.text? = newItem.description
    }
    
    public func setItemToDisplay(item: DataSource.TableRowEntry) {
        itemToDisplay = item;
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
