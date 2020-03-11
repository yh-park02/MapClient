//
//  ViewController.swift
//  MapClient
//
//  Created by TJOEUN-304 on 2020/03/11.
//  Copyright © 2020 TJOEUN-304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var t_lat: UITextField!
    @IBOutlet weak var t_lng: UITextField!
    @IBOutlet weak var t_content: UITextField!
    
    //http의 post요청을 시도하자
    @IBAction func btnClick(_ sender: Any) {
        var url = URL(string: "http://localhost:9999/regist")
        //요청 객체 생성
        var urlRequest = URLRequest(url: url!)
        
        //ppost란 요청의 바디에 실어서 보내야 하므로,
        //요청 형식을 구성해랴 한다.(머리:header + 몸:body)
        
        //header 정보 구성
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        //body 정보 구성
        urlRequest.httpMethod = "post"
        
        //json 객체 구성
        var json = [
            "lat":t_lat.text!,
            "lng":t_lng.text!,
            "content":t_content.text!
            ]
        
        //body에 json 객체 대입(문자열화 시켜서 == 시리얼화)
        do{
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        }catch let error{
            print("json 문자열화 실패", error)
        }
        
        //구성된 내용을 서버로 전송하되, 동기방식으로 하면
        //앱이 멈춘다. 비동기로 전송하자! AsyscTask(android)
        var urlSession = URLSession.shared
        
        var task = urlSession.dataTask(with: urlRequest, completionHandler: {data, response, error in
            //로직 작성할 예정
            //서버로부터 가져올 데이터가 있을 때 작성
            //즉 피드백을 받고 싶을 때
        })
        task.resume()//비동기 요청 수행
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

