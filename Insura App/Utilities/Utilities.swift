//
//  Utilities.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

let url: String = "https://jsonplaceholder.typicode.com"
let url_login = "\(url)/users"
let url_posts = "\(url)/posts"
let url_profile = "\(url)/users"

func alert(title : String, message : String, vc: UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        alert.dismiss(animated: true, completion: nil)
    }))
    vc.present(alert, animated: true, completion: nil)
}
