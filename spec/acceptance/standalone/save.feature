# encoding: utf-8
# language: ja
@javascript
@standalone
機能: Save - プログラムのセーブ(standaloneモード)
  シナリオ: セーブボタンを押してローカルマシンにプログラムを保存できる
    前提 "Ruby" タブを表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ プログラムの名前に "01.rb" を指定する

    もし サブメニューの "セーブボタン" をクリックする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば ホームディレクトリに "01.rb" が存在すること
    かつ ホームディレクトリの "01.rb" の内容が "puts 'Hello, World!'" であること
    かつ "メッセージ" に "セーブしました" を含むこと

  シナリオ: ローカルマシンに同じ名前のプログラムがある状態でセーブボタンを押して上書き保存する
    前提 "Ruby" タブを表示する
    かつ ホームディレクトリに "puts 'Hello, World!'" という内容の "01.rb" が存在する
    かつ テキストエディタに "n = 0" を入力済みである
    かつ プログラムの名前に "01.rb" を指定する

    もし サブメニューの "セーブボタン" をクリックする
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば 確認メッセージ "前に01.rbという名前でセーブしているけど本当にセーブしますか？\nセーブすると前に作成したプログラムは消えてしまうよ！" を表示すること
    かつ "メッセージ" に "セーブしました" を含むこと
    かつ ホームディレクトリの "01.rb" の内容が "n = 0" であること

  シナリオ: ローカルマシンに同じ名前のプログラムがある状態でセーブボタンを押すが、キャンセルして上書き保存をしない
    前提 "Ruby" タブを表示する
    かつ ホームディレクトリに "puts 'Hello, World!'" という内容の "01.rb" が存在する
    かつ テキストエディタに "n = 0" を入力済みである
    かつ プログラムの名前に "01.rb" を指定する
    かつ 確認ダイアログをキャンセルするようにしておく

    もし サブメニューの "セーブボタン" をクリックする
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば 確認メッセージ "前に01.rbという名前でセーブしているけど本当にセーブしますか？\nセーブすると前に作成したプログラムは消えてしまうよ！" を表示すること
    かつ "メッセージ" に "セーブをキャンセルしました" を含むこと
    かつ ホームディレクトリの "01.rb" の内容が "puts 'Hello, World!'" であること
