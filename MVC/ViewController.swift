//
//  ViewController.swift
//  MVC
//
//  Created by kvana_imac11 on 23/01/20.
//  Copyright © 2020 kvana_imac11. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var resultTable: UITableView!
    var cellid = "PostsCell"
    var responseArray = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultTable.delegate = self
        resultTable.dataSource = self
        callApi()
    }
     
    
    func callApi(){
        Alamofire.request(URL(string: "https://jsonplaceholder.typicode.com/posts")!, method: .get, parameters: nil, headers: nil).responseJSON{(response) in
            if let responseData = response.data{
                do {
                    let decodeJson = JSONDecoder()
                    decodeJson.keyDecodingStrategy = .convertFromSnakeCase
                    self.responseArray = try decodeJson.decode([DataModel].self, from: responseData)
                    self.resultTable.reloadData()
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
  
       
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 120
       }
       
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return self.responseArray.count
       }
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           var cell: PostsCell!
               if cell == nil {
                   cell = resultTable.dequeueReusableCell(withIdentifier: cellid) as? PostsCell
                cell.title.text = responseArray[indexPath.row].title
                cell.subtitle.text = responseArray[indexPath.row].body
                       return cell
                   }
               return cell
           }
       
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
       }


}

