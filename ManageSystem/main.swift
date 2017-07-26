//
//  main.swift
//  ManageSystem
//
//  Created by 沈威 on 2017/7/22.
//  Copyright © 2017年 沈威. All rights reserved.
//
import Foundation

func scanf() -> String {
    let input = String(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8)
    var str = input ?? ""
    str = str.substring(to: str.index(str.endIndex, offsetBy: -1))     // 去除换行符
    return str
}


func displayMenu(){
    var scores = [Float]()

    while 1==1 {
        print("************************************")
        print("     1--初始化数学成绩  ")
        print("     2--求成绩的平均值  ")
        print("     3--统计成绩大于85分的人数  ")
        print("     4--修改指定位置处的成绩")
        print("     5--打印输出所有成绩")
        print("     6--退出")
        print("************************************")
        print("请输入对应的数字进行操作")
        let choose:String = scanf()
        switch choose {
        case "1":
            scores.removeAll()
            scores = initScore()
        case "2":
            average(f: scores)
        case "3":
            over_85_list(f: scores)
        case "4":
            print("修改前：\(scores)")
            print("请输入要修改的数据（从0开始）")
            let index:String = scanf()
            print("请输入新的数据")
            let newscore:String = scanf()
            scores = update(f: scores, index: index, newScore: newscore)
            print("修改后")
            print("成绩为\n\(scores)")
        case "5":
            displayAllScore(f:scores)
        case "6":
            break
        default:
            print("你的输入有问题")
        }
    }
}


func initScore()->[Float]  {
    print("************************************")
    print("请输入要储存的数学成绩的数量")
    let menbers:String = scanf()
    let num = (menbers as NSString).intValue
    var temp = [Float]()
    for n in 1...num {
        print("************************************")
        print("请输入第\(n)个数据")
        let f:Float = (scanf() as NSString).floatValue
        temp.append(f)
    }
    return temp
}
func average(f:[Float]){
    var total:Float = 0
        for item:Float in f {
            total+=item
        }
        print("平均值为：\(total/Float((f.count)))")
}
func over_85_list(f:[Float]){
    var over85 = 0
    for item:Float in f {
        if item>85.0 {
            over85+=1
        }
    }
    print("超过85分的人数为：\(over85)")
}
func update( f:[Float], index:String, newScore:String) ->[Float]{
    var f = f
    f[(index as NSString).integerValue] = (newScore as NSString).floatValue
    return f
}
func displayAllScore( f:[Float]){
    print("成绩为\n\(f)")
}


displayMenu()



