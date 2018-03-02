import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let fruits = ["リンゴ", "みかん", "ぶどう"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let url_text = "https://news.yahoo.co.jp/pickup/computer/rss.xml"
        guard let url = NSURL(string: url_text) else{return}
        //parser(解析)作られたか?
        guard let parser = XMLParser(contentsOf: url as URL) else{
            return
        }
        parser.delegate = self;
        parser.parse() //解析開始
    }
    
    // XML解析開始時に実行されるメソッド
    func parserDidStartDocument(_ parser: XMLParser) {
        print("XML解析開始しました")
    }
    
    // 解析中に要素の開始タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict:[String : String]) {
    }
    
    // 開始タグと終了タグでくくられたデータがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("要素:" + string)
    }
    
    // 解析中に要素の終了タグがあったときに実行されるメソッド
    func parser(_ parser: XMLParser, didEndElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?) {
    }
    
    // XML解析終了時に実行されるメソッド
    func parserDidEndDocument(_ parser: XMLParser) {
        print("XML解析終了しました")
    }
    
    // 解析中にエラーが発生した時に実行されるメソッド
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("エラー:" + parseError.localizedDescription)
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    /// セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = fruits[indexPath.row]
        
        return cell
    }
    
    /// セルが選択された時に呼ばれるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セル番号：(indexPath.row) セルの内容：(fruits[indexPath.row])")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

