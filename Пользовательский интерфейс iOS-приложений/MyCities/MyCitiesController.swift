

import UIKit

class MyCitiesController: UITableViewController {
    
    var cities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // определяем количество столбцов
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // определяем количество столбцов
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // получаем пул ячеек
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCityCell", for: indexPath) as! MyCitiesCell
        // получаем данные города для конкретной строки
        let city = cities[indexPath.row]
        // устанавливаем данные города в значение ячейки
        cell.cityName.text = city
        
        return cell
    }
    
    @IBAction func addCities(segue: UIStoryboardSegue) {
        // проверяем идентификатор сегуи чтобы убедиться, что это нужный переход
        guard segue.identifier == "addCities" else { return }
        // получаем ссылку на контроллер с которого осуществлен переход
        let allCitiesController = segue.source as! AllCitiesController
        // получаем индекс выделенной ячейки
        guard let indexPath = allCitiesController.tableView.indexPathForSelectedRow else { return }
        // получаем данные города по индексу
        let city = allCitiesController.cities[indexPath.row]
        //проверяем на дубли список друзей
        guard !cities.contains(city) else { return }
        // добавляем город в список выбранных городов
        cities.append(city)
        //обновляем таблицу
        tableView.reloadData()
    }
    
    //функция для удаления городов из списка выбранных
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // если была нажата кнопка "Удалить"
        if editingStyle == .delete {
            // удаляем город из массива
            cities.remove(at: indexPath.row)
            // удаляем город из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
