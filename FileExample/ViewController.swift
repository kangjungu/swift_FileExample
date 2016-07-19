//
//  ViewController.swift
//  FileExample
//
//  Created by JHJG on 2016. 7. 15..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textBox: UITextField!
    
    var fileMgr: NSFileManager = NSFileManager.defaultManager()
    var docsDir: String?
    var dataFile: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filemgr = NSFileManager.defaultManager()
        
        let dirPath = filemgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        //파일에 대한 전체 경로
        dataFile = dirPath[0].URLByAppendingPathComponent("datafile.dat").path
        
        //파일이 존재하는지 확인
        if fileMgr.fileExistsAtPath(dataFile!){
            //파일의 내용을 읽은 후에 텍스트 필드 객체의 text 속성에 내용을 할당하여 사용자에게 표시되도록 한다.
            let databuffer = fileMgr.contentsAtPath(dataFile!)
            let datastring = NSString(data: databuffer!, encoding: NSUTF8StringEncoding)
            textBox.text = datastring as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //입력된 문자열이 애플리케이션의 Documents 디렉토리에 있는 datafile.dat이라는 파일에 저장된다.
    @IBAction func saveText(sender: UIButton) {
        let databuffer = (textBox.text)!.dataUsingEncoding(NSUTF8StringEncoding)
        
        fileMgr.createFileAtPath(dataFile!, contents: databuffer, attributes: nil)
    }

}

