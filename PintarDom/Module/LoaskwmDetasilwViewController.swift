//
//  LoaskwmDetasilwViewController.swift
//  PintarDom
//
//  Created by Yu Chen  on 2025/11/14.
//

import UIKit

class LoaskwmDetasilwViewController: EsensiilsadwsiwViewController {

    private var chans_number: String?
    
    init(chansNumber num: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        self.chans_number = num
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
