//
//  ViewController.swift
//  h2
//
//  Created by User18 on 2018/11/30.
//  Copyright © 2018 User18. All rights reserved.
//

import UIKit

struct questionStruct {
    var question:String
    var choose:[String]=[]
    var answer:Int
    var selected:Bool
}

class ViewController: UIViewController {
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var buttonRE: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    var count=1
    var score=0
    var timerCount=10
    var questionArrayBox:[questionStruct]=[]
    var randomQuestion:[questionStruct]=[]
    
    func setQuestionBox(){
        questionArrayBox.append(questionStruct(question:"（16＋？）÷ 3 = 7", choose:["3","4","5","6"], answer: 3, selected:false))
        questionArrayBox.append(questionStruct(question:"假使昨天是星期二，則大後天是?", choose:["星期三","星期四","星期五","星期六"], answer: 4, selected:false))
        questionArrayBox.append(questionStruct(question:"4 × 10 + 7 × 9 –12 × 4 =？", choose:["45","55","65","75"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"正方體的每邊增加為 2 倍時，體積增加為", choose:["4倍","6倍","8倍","9倍"], answer: 3, selected:false))
        questionArrayBox.append(questionStruct(question:"字典一本，定價 10 元，打八折後再照二五折出售，實價多少元？", choose:["5","6","7.5","7.2"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"'我要＿反省自己，以策勵將來' 請問＿該填入何者？", choose:["確實","切實","正確","切切"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"「啣結」:意指", choose:["報恩","製造","行賞","別離"], answer: 1, selected:false))
        questionArrayBox.append(questionStruct(question:"2 公尺立方是 2 立方公尺的", choose:["1倍","2倍","4倍","8倍"], answer: 3, selected:false))
        questionArrayBox.append(questionStruct(question:"按“ㄅㄨˋ”就班", choose:["不","部","步","佈"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"有人把 500 元存入銀行，半年後，得本利和 560 元，利率是", choose:["月利 1 分","月利 2 分","月利 3 分","月利 4 分"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"（2，3，4），（1，5，3），（1，1，? ） 請問？應該填入何者", choose:["8","7","6","5"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"8，6，10，8，14，12，?  請問？應填入何者 ", choose:["8","10","13","20"], answer: 4, selected:false))
        questionArrayBox.append(questionStruct(question:"把「庭院深深深幾許」七字重新排列，使三個「深」字不完全在一起的排法共有幾種？", choose:["120","720","840","940"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"一圓的圓周有 5 個相異的點，則可以連成多少條不重複的直線？", choose:["8","9","10","11"], answer: 3, selected:false))
        questionArrayBox.append(questionStruct(question:"一人每週工作 40 小時，每小時可得 X 元，超過 40 小時，多一小時可得 2X 元，若一週工作 46 小時，可得多少元：", choose:["46X元","49X元","52X元","55X元"], answer: 3, selected:false))
        questionArrayBox.append(questionStruct(question:"有一數列之和為 510，平均值為 34，則共有幾個數？", choose:["20","25","10","15"], answer: 4, selected:false))
        questionArrayBox.append(questionStruct(question:"統計之於_，好比_之於物理", choose:["幾何…運動","大學…高中","數學…力學","算術…天文"], answer: 3, selected:false))
        questionArrayBox.append(questionStruct(question:"重量之於 ，好比 之於公尺。", choose:["公寸…質量","公斤…長度","天平…體積","體重…面積"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"1/3 + 1/5 =？", choose:["1/8","1/15","2/8","8/15"], answer: 4, selected:false))
        questionArrayBox.append(questionStruct(question:"小明的血型為 O 型，小明父親血型不可能為", choose:["AB","A","B","O"], answer: 1, selected:false))
        questionArrayBox.append(questionStruct(question:"會破壞臭氧層的物質為？", choose:["甲烷","二氧化碳","乙烯","氟氯碳化物"], answer: 4, selected:false))
        questionArrayBox.append(questionStruct(question:"雪融化時會發生何種反應？", choose:["吸熱","放熱","蒸發","凝固"], answer: 1, selected:false))
        questionArrayBox.append(questionStruct(question:"「灼灼」：意指?", choose:["光明的樣子","黯淡","熱熱的","高明"], answer: 1, selected:false))
        questionArrayBox.append(questionStruct(question:"努力：成功=怠惰：_", choose:["失望","失敗","傷心","死亡"], answer: 2, selected:false))
        questionArrayBox.append(questionStruct(question:"1，9，3，6，5，3，?", choose:["0","3","4","7"], answer: 4, selected:false))
    }
    func ramdomNumber()
    {
        while  randomQuestion.count<=10{
            
            let number = Int.random(in: 0...questionArrayBox.count-1)
            if(questionArrayBox[number].selected==false){
                randomQuestion.append(questionArrayBox[number])
                questionArrayBox[number].selected=true
            }
        }
        print(randomQuestion)
    }
    func setQuestion()
    {
        questionNumber.text="Q"+String(count)+"."
        questionLabel.text=randomQuestion[count-1].question
        buttonA.setTitle(randomQuestion[count-1].choose[0], for:UIControl.State.normal)
        buttonB.setTitle(randomQuestion[count-1].choose[1], for:UIControl.State.normal)
        buttonC.setTitle(randomQuestion[count-1].choose[2], for:UIControl.State.normal)
        buttonD.setTitle(randomQuestion[count-1].choose[3], for:UIControl.State.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestionBox()
        ramdomNumber()
        setQuestion()
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if((sender==buttonA&&randomQuestion[count-1].answer==1)||(sender==buttonB&&randomQuestion[count-1].answer==2)||(sender==buttonC&&randomQuestion[count-1].answer==3)||(sender==buttonD&&randomQuestion[count-1].answer==4))
        {
            score = score + 10
            pointLabel.text="得分："+String(score)
        }
        
        timerCount=10;
        count=count+1
        //設定下一題的題目 題號
        if (count<=10){
            setQuestion()
        }
        else{
            buttonA.isEnabled=false
            buttonB.isEnabled=false
            buttonC.isEnabled=false
            buttonD.isEnabled=false
            buttonRE.isEnabled=true
            buttonRE.isHidden=false
            
            if(score<=30){
                let alertController = UIAlertController(
                    title: "測驗結束",
                    message: "得分：\(score)分\n測驗結果：腦弱",
                    preferredStyle: .alert)
                
                let okBtn = UIAlertAction(
                    title: "確認",
                    style: .default,
                    handler:{
                        (action: UIAlertAction!) -> Void in
                })
                alertController.addAction(okBtn)
                self.present(alertController, animated: true, completion: nil)
            }
            else if(score<=80){
                let alertController = UIAlertController(
                    title: "測驗結束",
                    message: "得分：\(score)分\n測驗結果：就很一般",
                    preferredStyle: .alert)
                
                let okBtn = UIAlertAction(
                    title: "確認",
                    style: .default,
                    handler:{
                        (action: UIAlertAction!) -> Void in
                })
                alertController.addAction(okBtn)
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                let alertController = UIAlertController(
                    title: "測驗結束",
                    message: "得分：\(score)分\n測驗結果：unbelievable",
                    preferredStyle: .alert)
                
                let okBtn = UIAlertAction(
                    title: "確認",
                    style: .default,
                    handler:{
                        (action: UIAlertAction!) -> Void in
                })
                alertController.addAction(okBtn)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func restartClick(_ sender: Any) {
        for i in (0...questionArrayBox.count-1) {
            questionArrayBox[i].selected=false
        }
        randomQuestion.removeAll()
        ramdomNumber()
        count=1
        setQuestion()
        score=0
        pointLabel.text="得分："+String(score)
        buttonA.isEnabled=true
        buttonB.isEnabled=true
        buttonC.isEnabled=true
        buttonD.isEnabled=true
        buttonRE.isEnabled=false
        buttonRE.isHidden=true
    }
}
