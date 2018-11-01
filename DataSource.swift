import Foundation

class DataSource {
    enum Section {
        case main, secondary
    }
    
    public struct TableRowEntry {
        var section: Section?
        var title: String
        var description: String
    }
    
    
    var ds:[TableRowEntry]
    
    init() {
        ds = []
        for i in 0..<100 {
            var newSection = Section.main
            if i % 2 == 0 {
                newSection = Section.secondary
            }
            
            let entry = TableRowEntry(section: newSection,
                                      title: "Row \(i)", description: "Describe the row at index \(i), section \(newSection)")
            ds.append(entry)
        }
        
    }
    
    var totalRowCount: Int {
        return ds.count
    }
    
    var mainRows: [TableRowEntry] {
        return ds.filter{ $0.section == .main }
    }
    
    var secondaryRows: [TableRowEntry] {
        return ds.filter{$0.section == .secondary }
    }
    
    func getEntryAtRow(row: Int, section: Int) -> TableRowEntry {
        switch section {
        case 0:
            return mainRows[row]
        case 1:
            return secondaryRows[row]
        default:
            return ds[row]
        }
    }
    
    func getNumberOfRowsForSection(section: Section) -> Int {
        let entriesForSection = ds.filter{ $0.section == section }
        return entriesForSection.count
    }
}
