# encoding: utf-8
# language: ja
@javascript
機能: Rubyのプログラムをテキストエディタ機能で編集できる
  シナリオ: トップページにアクセスしてエディタ画面を表示する
    もし "トップページ" にアクセスする

    ならば "Rubyタブ" が表示されていること
    かつ "テキストエディタ" が表示されていること
    かつ "プログラム名の入力欄" が表示されていること
    かつ "セーブボタン" が表示されていること
    かつ テキストエディタにフォーカスがあること
    かつ テキストエディタの 0 行目の 0 文字目にカーソルがあること

  シナリオ: チェックボタンを押してプログラムの正しいかチェックできる
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである

    もし "チェックボタン" をクリックする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば "メッセージ" に "エラー" を含まない

    もし テキストエディタに "puts Hello, World!'" を入力済みである
    かつ "チェックボタン" をクリックする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば "メッセージ" に "エラー" を含む
    かつ "メッセージ" に "1行、19文字: syntax error, unexpected tSTRING_BEG, expecting keyword_do or '{' or '('" を含む
    かつ "メッセージ" に "1行: unterminated string meets end of file" を含む

  シナリオ: プログラムを読み込む
    前提 "エディタ" 画面を表示する

    もし "files/01.rb" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば テキストエディタに "files/01.rb" を読み込むこと
    かつ "プログラム名の入力欄" は "01.rb" である

  シナリオ: プログラムを入力済み状態でプログラムを読み込む
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである

    もし "files/01.rb" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば テキストエディタに "files/01.rb" を読み込むこと
    かつ "プログラム名の入力欄" は "01.rb" である

  シナリオ: 間違って画像を読み込もうとする
    前提 "エディタ" 画面を表示する

    もし "files/favicon.ico" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば テキストエディタのプログラムは "" であること
    かつ "プログラム名の入力欄" は "" である
    かつ "メッセージ" に "favicon.icoはRubyのプログラムではありません" を含む

  シナリオ: プログラムを修正後にロードボタンを押す
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである

    もし "ロードボタン" をクリックする

    ならば 確認メッセージ "まだセーブしていないのでロードするとプログラムが消えてしまうよ！それでもロードしますか？" を表示する

  @target
  シナリオ: プログラムを修正後にセーブしてからロードボタンを押す
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ プログラムの名前に "01.rb" を指定する
    かつ "セーブボタン" をクリックする
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ "01.rb" をダウンロードする

    もし "ロードボタン" をクリックする

    ならば 確認メッセージを表示しない

  シナリオ: プログラムを修正後にプログラムをロードしてからロードボタンを押す
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ "files/01.rb" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    もし "ロードボタン" をクリックする

    ならば 確認メッセージを表示しない

  シナリオ: プログラムを修正後に間違って画像をロードしてからロードボタンを押す
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ "files/favicon.ico" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    もし "ロードボタン" をクリックする

    ならば 確認メッセージ "まだセーブしていないのでロードするとプログラムが消えてしまうよ！それでもロードしますか？" を表示する

  シナリオ: プログラムを入力後にページを遷移する
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである

    もし ページをリロードする
    かつ プログラムの名前に "01.rb" を指定する
    かつ 警告ダイアログの "dismiss" ボタンをクリックする

    ならば テキストエディタのプログラムは "puts 'Hello, World!'" であること
    かつ "プログラム名の入力欄" は "01.rb" である
