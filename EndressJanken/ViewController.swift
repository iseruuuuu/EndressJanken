//
//  ViewController.swift
//  EndressJanken
//
//  Created by 井関竜太郎 on 2021/01/30.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var gu: UIButton!
    @IBOutlet weak var choki: UIButton!
    @IBOutlet weak var pa: UIButton!
 
    @IBOutlet weak var hart: UILabel!
    @IBOutlet weak var battle: UILabel!
    
    @IBOutlet weak var playerrr: UILabel!
    @IBOutlet weak var enemyyy: UILabel!
    
    
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    var gugu = UIImage(named: "gu")!
    var chocho = UIImage(named: "cho")!
    var papa = UIImage(named: "pa")!
    
    
    var player: Int = 0
    var enemypoint:Int = 0
    var life: Int = 3
    var win: Int = 0
    
    var n:UInt32!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   //     myImage.image = gugu
   //     enemyImage.image = gugu
        playerrr.text = "✊"
        enemyyy.text =  "✊"
    }
    
    @IBAction func guAction(_ sender: Any) {
   //     myImage.image = gugu
       playerrr.text = "✊"
        player = 0
        enemyAction()
        
        
    }
    
    @IBAction func chokiAction(_ sender: Any) {
   //     myImage.image = chocho
        playerrr.text = "✌️"
        player = 1
        enemyAction()
    }
    
    @IBAction func paAction(_ sender: Any) {
   //     myImage.image = papa
        playerrr.text = "✋"
        player = 2
        enemyAction()
    }
    
    
    //相手の手
    func enemyAction() {
        let enemy = Int.random(in: 0...2)
        if enemy ==  0{
  //          enemyImage.image = gugu
            enemyyy.text = "✊"
            enemypoint = 0
        }else if enemy == 1 {
  //          enemyImage.image = chocho
            enemyyy.text = "✌️"
            enemypoint = 1
        }else if enemy == 2 {
  //          enemyImage.image = papa
            enemyyy.text = "✋"
            enemypoint = 2
        }
        JankenCheck()
    }
    
    func JankenCheck() {
        
        if (player == enemypoint) {
            battle.text = "引き分け！\(win)勝目！"
        }else {
            
            //ぐー対チョキ
            if(player == 0 && enemypoint == 1) {
                print("ぐー勝ち！")
                win += 1
                battle.text = "勝ち！\(win)勝目！"
                
            }else if(player == 1 && enemypoint == 2) {
                print("チョキ勝ち！")
                win += 1
                battle.text = "勝ち！\(win)勝目！"
            }else if (player == 2 && enemypoint == 0) {
                print("パーがち！")
                win += 1
                battle.text = "勝ち！\(win)勝目！"
            }else{
                print("負け！")
                life -= 1
            }
            if win == 30 {
                battle.text = "この画面を送って"
            }
            
            //ライフの管理　→ もし動画を見るとライフが一つ回復する？？　→ランダムにする。
            if life == 2 {
                hart.text = "ライフ：❤️❤️"
            }else if life == 1 {
                hart.text = "ライフ：❤️"
            }else if life ==  0 {
                hart.text = "ゲームオーバー"
                win = 0
                let gameOver = self.storyboard?.instantiateViewController(identifier: "Gameover") as! gameOver
                gameOver.modalPresentationStyle = .fullScreen
                self.present(gameOver, animated: true, completion: nil)
                
            }
        }
        
    }
    
}





























