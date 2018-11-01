
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let dataSource = DataSource()
    
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
    }


}

