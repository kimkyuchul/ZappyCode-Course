//
//  CourseTableViewController.swift
//  ZappyCode
//
//  Created by qualson1 on 2022/06/29.
//

import UIKit
import Kingfisher

class CourseTableViewController: UITableViewController {

    var course : [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //getCourses()
    }
    
    func getCourses() {
        //https://zappycode.com/api/courses
        
        if let url = URL(string: "https://zappycode.com/api/courses") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request){ (data, request, error) in
                
                if error != nil {
                    print ("Error")
                } else if data != nil {
                    if let coursesFromAPI = try? JSONDecoder().decode([Course].self, from: data!) {
                        //DispatchQueue.main.async 는 메인스레드에서 {} 안에 있는 작업을 비동기적으로 수행시키는 역할을 한다. UI는 메인스레드에서 처리해줘야하는데, 데이터를 얻어온 스레드에서 UI를 갱신시키려 하니 오류를 발생시킨것
                        DispatchQueue.main.async {
                            self.course = coursesFromAPI
                            self.tableView.reloadData()
                        }
                    }
                }
                
            }.resume()
            
            
            
        }
        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return course.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "couserCell", for: indexPath) as? CourseTableViewCell {
        
        let course = course[indexPath.row]
        
            cell.courseTitle.text = course.title
            cell.courseSubTitle.text = course.subtitle
            
            if let url = URL(string: course.imageURL) {
                cell.courseImage.kf.setImage(with: url)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
    @IBAction func reloadTapped(_ sender: Any) {
        getCourses()
        }
    
    }
