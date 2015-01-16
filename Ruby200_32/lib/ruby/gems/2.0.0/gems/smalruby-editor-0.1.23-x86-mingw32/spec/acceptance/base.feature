# encoding: utf-8
# language: ja
@javascript
機能: Base - 基本
  シナリオ: トップページにアクセスする
    もし "トップページ" にアクセスする

    ならば "ブロックタブ" が表示されていること
    かつ "プログラム名の入力欄" が表示されていること
    かつ "ダウンロードボタン" が表示されていること
    かつ "ログインボタン" が表示されていないこと

  シナリオ: ブロックモードでブロックを配置後にページを遷移する
    前提 "ブロック" タブを表示する

    もし 次のブロック("ruby_statement")を配置する:
      """
      %block{:type => "ruby_statement", :x => "0", :y => "0"}
        %field{:name => "STATEMENT"}<
          stage1 = Stage.new(color: "white")
      """
    かつ プログラムの名前に "01.rb" を指定する
    かつ ページをリロードする
    かつ 警告ダイアログの "dismiss" ボタンをクリックする

    ならば 次のXMLと同等のブロックが配置されていること:
      """
      <xml>
        <block type="ruby_statement" x="0" y="0">
          <field name="STATEMENT">stage1 = Stage.new(color: "white")</field>
        </block>
      </xml>
      """
    かつ "プログラム名の入力欄" は "01.rb" であること

  シナリオ: プログラムを変更していない状態でブロックモードからRubyモードに切り替えてページを遷移する
    前提 "ブロック" タブを表示する
    かつ "files/01.rb.xml" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    もし "Rubyタブ" にタブを切り替える
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ ページをリロードする

    ならば 次のXMLと同等のブロックが配置されていること:
       """
       <xml></xml>
       """
    かつ "プログラム名の入力欄" は "" であること

  シナリオ: プログラムを変更した状態でブロックモードからRubyモードに切り替えてページを遷移する
    前提 "ブロック" タブを表示する
    かつ 次のブロック("ruby_statement")を配置する:
      """
      %block{:type => "ruby_statement", :x => "0", :y => "0"}
        %field{:name => "STATEMENT"}<
          stage1 = Stage.new(color: "white")
      """
    かつ プログラムの名前に "01.rb" を指定する

    もし "Rubyタブ" にタブを切り替える
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ ページをリロードする

    ならば 次のXMLと同等のブロックが配置されていること:
      """
      <xml>
        <block type="ruby_statement" x="0" y="0">
          <field name="STATEMENT">stage1 = Stage.new(color: "white")</field>
        </block>
      </xml>
      """
    かつ "プログラム名の入力欄" は "01.rb" であること

  シナリオ: エディタ画面を表示してRubyタブに切り替える
    前提 "トップページ" にアクセスする

    もし "Rubyタブ" にタブを切り替える

    ならば "Rubyタブ" が表示されていること
    かつ "テキストエディタ" が表示されていること
    かつ "プログラム名の入力欄" が表示されていること
    かつ "ダウンロードボタン" が表示されていること
    かつ テキストエディタにフォーカスがあること
    かつ テキストエディタの 0 行目の 0 文字目にカーソルがあること

  シナリオ: Rubyモードでプログラムを入力後にページを遷移する
    もし "Ruby" タブを表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ プログラムの名前に "01.rb" を指定する
    かつ ページをリロードする
    かつ 警告ダイアログの "dismiss" ボタンをクリックする

    ならば テキストエディタのプログラムは "puts 'Hello, World!'" であること
    かつ "プログラム名の入力欄" は "01.rb" であること

  シナリオ: プログラムを変更していない状態でRubyモードからブロックモードに切り替えてページを遷移する
    前提 "Ruby" タブを表示する
    かつ "files/01.rb" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    もし "ブロックタブ" にタブを切り替える
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ ページをリロードする

    ならば テキストエディタのプログラムは "" であること
    かつ "プログラム名の入力欄" は "" であること

  シナリオ: プログラムを変更した状態でRubyモードからブロックモードに切り替えてページを遷移する
    前提 "Ruby" タブを表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ プログラムの名前に "01.rb" を指定する

    もし "ブロックタブ" にタブを切り替える
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ ページをリロードする
    かつ 警告ダイアログの "dismiss" ボタンをクリックする

    ならば テキストエディタのプログラムは "puts 'Hello, World!'" であること
    かつ "プログラム名の入力欄" は "01.rb" であること

  シナリオ: ブロックモードでブロックを読み込んだ直後にリセットボタンを押す
    前提 "ブロック" タブを表示する
    かつ "files/01.rb.xml" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    もし "サブメニューボタン" をクリックする
    かつ サブメニューの "リセットボタン" をクリックする
    かつ JavaScriptによる処理が終わるまで待つ

    ならば ブロックが配置されていないこと
    かつ "プログラム名の入力欄" は "" であること

  シナリオ: ブロックモードでブロックを配置後にリセットボタンを押す
    前提 "ブロック" タブを表示する
    かつ 次のブロック("ruby_statement")を配置する:
      """
      %block{:type => "ruby_statement", :x => "0", :y => "0"}
        %field{:name => "STATEMENT"}<
          stage1 = Stage.new(color: "white")
      """
    かつ プログラムの名前に "01.rb" を指定する

    もし "サブメニューボタン" をクリックする
    かつ サブメニューの "リセットボタン" をクリックする
    かつ JavaScriptによるアニメーションが終わるまで待つ

    ならば "リセット確認ダイアログ" が表示されていること

    もし "リセット確認ダイアログのやめるボタン" をクリックする
    かつ JavaScriptによる処理が終わるまで待つ

    ならば 次のXMLと同等のブロックが配置されていること:
      """
      <xml>
        <block type="ruby_statement" x="0" y="0">
          <field name="STATEMENT">stage1 = Stage.new(color: "white")</field>
        </block>
      </xml>
      """
    かつ "プログラム名の入力欄" は "01.rb" であること

    もし "サブメニューボタン" をクリックする
    かつ サブメニューの "リセットボタン" をクリックする
    かつ JavaScriptによるアニメーションが終わるまで待つ

    ならば "リセット確認ダイアログ" が表示されていること

    もし "リセット確認ダイアログのリセットボタン" をクリックする
    かつ JavaScriptによる処理が終わるまで待つ

    ならば ブロックが配置されていないこと
    かつ "プログラム名の入力欄" は "" であること

    もし "サブメニューボタン" をクリックする
    かつ サブメニューの "リセットボタン" をクリックする
    かつ JavaScriptによるアニメーションが終わるまで待つ

    ならば "リセット確認ダイアログ" が表示されていないこと
