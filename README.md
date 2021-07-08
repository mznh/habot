# habot
habomai jiro をbot化

著作権の関係で生のテキストファイルはこのリポジトリには配置していません

## 辞書ファイルの作成法
```
sudo /usr/lib/mecab/mecab-dict-index \
  -d ${システムの辞書ファイルの場所} \
  -u ${自分の辞書ファイルの置き場所} \
  -f utf-8 \
  -t utf-8 \
  habomai_dict.csv
  ```
