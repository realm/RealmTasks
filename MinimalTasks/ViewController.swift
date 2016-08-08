/*************************************************************************
 *
 * REALM CONFIDENTIAL
 * __________________
 *
 *  [2016] Realm Inc
 *  All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Realm Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Realm Incorporated
 * and its suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Realm Incorporated.
 *
 **************************************************************************/

import UIKit
import RealmSwift

// MARK: Models

final class TaskListList: Object {
    let items = List<TaskList>()
    dynamic var id = 0

    override static func primaryKey() -> String? {
        return "id"
    }
}

final class TaskList: Object {
    dynamic var text = ""
    dynamic var completed = false
    dynamic var id = ""
    let items = List<Task>()

    override static func primaryKey() -> String? {
        return "id"
    }
}

final class Task: Object {
    dynamic var text = ""
    dynamic var completed = false
}

// MARK: View Controller

class ViewController: UITableViewController {
    var items = List<Task>()

    // MARK: Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        items.append(Task(value: ["text": "My First Task"]))
    }

    func setupUI() {
        title = "My Tasks"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: UITableView

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        cell.textLabel?.alpha = item.completed ? 0.5 : 1
        return cell
    }
}
