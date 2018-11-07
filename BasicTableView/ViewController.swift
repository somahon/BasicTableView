
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var descriptionTextfield: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = DataSource()
    
    @IBAction func addNewRowToTable(_ sender: Any) {
        guard let title = titleTextfield.text, !title.isEmpty else {
            return
        }
        
        guard let desc = descriptionTextfield.text, !desc.isEmpty else {
            return
        }
        
        //create new entry object
        let entry = DataSource.TableRowEntry(section: .main, title: title, description: desc)
        
        //add to the datasource and reload the table view to show the new cell
        dataSource.pushNewEntry(entry)
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        let entry = dataSource.getEntryAtRow(row: indexPath.row, section: indexPath.section)
        
        cell.textLabel?.text = entry.title
        cell.imageView?.image = UIImage(named: "Clock")
        cell.detailTextLabel?.text = entry.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return dataSource.mainRows.count
        case 1:
            return dataSource.secondaryRows.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "First View Controller"
    }


}

