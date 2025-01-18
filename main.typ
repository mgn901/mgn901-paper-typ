#import "@preview/metalogo:1.2.0": *
#import "@preview/roremu:0.1.0": roremu
#import "libs/mgn901-paper/paper.typ": paper
#import "libs/mgn901-paper/type-style.typ": type-style
#import "libs/presets/mgn901.typ": (
  heading-type-settings,
  font-settings,
  page-settings,
  type-settings,
)
#import "libs/article-frontmatter.typ": article-frontmatter
#import "libs/thesis-cover.typ": thesis-cover
#import "libs/thesis-outline.typ": thesis-outline

// テンプレートの設定

#show: paper.with(
  document-settings: (lang: "ja"),
  page-settings: page-settings,
  font-settings: font-settings,
  type-settings: type-settings,
  heading-type-settings: heading-type-settings,
  heading-font-settings: (font-settings.heading,),
  heading-settings: (
    (label-width: 1em, numbering: "1.1.", break-before: false),
    (label-width: 2em, numbering: "1.1.", break-before: false),
    (label-width: 3em, numbering: "1.1.", break-before: false),
    (label-width: 4em, numbering: "1.1.", break-before: false),
    (label-width: 5em, numbering: "1.1.", break-before: false),
    (label-width: 6em, numbering: "1.1.", break-before: false),
  ),
)

#show raw.where(block: true): it => {
  show "\n": "↵\n"
  it
}

// テンプレートの設定 終わり

// 前付け

#article-frontmatter(
  title: "レポート・論文組版向けTypstテンプレート「mgn901-paper-typ」",
  subtitle: [],
  author: [めがね901\ 個人サークル めがね901\ https://mgn901.com],
  date: [],
  line-length: page-settings.line-length,
  column-numbers: page-settings.column-numbers,
  column-gap: page-settings.column-gap,
  title-type-settings: type-settings.frontmatter-title,
  title-font-settings: font-settings.heading,
  subtitle-type-settings: type-settings.frontmatter-default,
  subtitle-font-settings: font-settings.default,
  author-type-settings: type-settings.frontmatter-default,
  author-font-settings: font-settings.default,
  default-type-settings: type-settings.default,
)

// 前付け 終わり

// 本文

= はじめに

本稿では、組版エンジン「Typst」，および，レポート・論文組版向けTypstテンプレート「mgn901-paper-typ」の使用方法を紹介します．

= Typstとは

コンピュータ上で印刷物を作成するためには，コンピュータに入力した文字や図表を，印刷物として読みやすいように配置（「組版」）して，PDFファイルなどの画像ファイルとして出力したり，プリンタに印刷させたりすることができるソフトウェアが必要です。このようなソフトウェアのことを「組版エンジン」と呼びます．

Typst @typst:index は，レポートや論文の組版に用いられることを念頭に置いている組版エンジンです．専用のマークアップ言語を用いて記述されたテキストファイル（typファイル）を読み込み，組版処理を行い，PDFファイルなどとして出力することができます．

以下では，Wordおよび#[#LaTeX]とTypstを比較します．#ref(<table:Word-LaTeX-Typstの比較>)は，複数の観点で三者を表で比較したものです．

== Wordなどのワープロソフトとの比較

Wordなどのワープロソフトは，Typstや#[#LaTeX]のような組版エンジンとは異なりますが，コンピュータ上で組版を行えるソフトウェアであるという点では同じです．ワープロソフトを使って組版する場合は，文書ファイルの作成や編集をワープロソフトの画面上で行い，作成した文書ファイルをPDFに変換して出力したり，プリンタに印刷させたりすることができます．

*ワープロソフトの長所*#h(1em)ワープロソフトでは，マウス操作などによって画面上で直観的に文書ファイルを編集することができますが，文書ファイルの編集には，その文書ファイルに対応しているワープロソフトが必要です．Typstが行うのは組版処理だけなので，画面上での直観的な編集はできません．

*Typstの長所*#h(1em)しかし，Typstに読み込ませるtypファイルはただのテキストファイルなので，テキストエディタさえあれば，typファイルの作成や編集ができます．また書式設定等は，typファイルに専用の命令を書いて行うので，同じような設定をするのにマウスを何度もクリックする必要はありません．typファイルの内容を再利用するのも簡単です．

== #[#LaTeX]との比較

レポートや論文の組版に用いられる組版エンジンとしては#[#LaTeX]などもあります．

*#[#LaTeX]の長所*#h(1em)#[#LaTeX]は学術の世界では以前から一般的に用いられてきた組版エンジンです．そのため，#[#LaTeX]に関する情報は本やインターネットである程度は見つかります．学術機関からクラスファイルが提供されていることもあります．また，組版結果も美しく，特に数式の組版結果の美しさで有名です．

*Typstの長所*#h(1em)#[#LaTeX]を導入したり思い通りに使いこなしたりするには，必要な前提知識が多いといわれています．特に和文組版においてそれが顕著だといわれています．一方で，Typstの場合は，レポートや論文の組版でよく使われる，数式組版や相互参照のための仕組みが整っていて，そのためにTypst以外のソフトウェアをインストールする必要はありません．また，組版の速さは#[#LuaLaTeX]などの#[#LaTeX]処理系と比べても非常に高速で，100ページにわたる印刷物であっても1秒足らずで組み上げることができます．

#figure(
  placement: auto,
  scope: "parent",
  caption: [Word，#LaTeX，Typstの比較],
  table(
    columns: 7,
    [], [*種類*], [*操作方法*], [*相互参照*], [*文献管理*], [*書式設定*], [*性能*],
    [*Word*],
    [ワープロソフト],
    [画面に表示された文書を，マウスとキーボードを用いた操作によって編集する．],
    [参照したい項目には先に番号を付ける必要がある．項目の増減があった場合は「フィールドの更新」操作を行う必要がある．],
    [書誌情報の形式は独自形式で，BibTeXなどをその独自形式に変換するツールを用いるか，手で入力する．書誌情報リストのスタイルを規定するスタイルファイルは独自形式で，配布されているスタイルファイルも，独自のスタイルファイルを作成する際の参考になる情報も少ない．これらの事情から，文書本文に書誌情報を直書きすることが多い．],
    [文書の各所に「スタイル」を適用することで，文書の複数の部分を同じ見た目にすることができる．スタイルに関連付けられた見た目を変更すると，そのスタイルが適用されている部分の見た目に反映される．ある部分の見た目がスタイルによって実現されているのか，それとも個別の書式設定によって実現されているのかは，見ただけではわからない．],
    [数式や図表を多用すると動作が重くなる．美しい組版結果を得るためには，マウスを多用した細かい調整を行う必要がある．],

    [*#LaTeX*],
    [組版エンジン],
    [テキストエディタで編集したtexファイルを読み込ませて，組版処理を行い，PDFファイルを出力させる．処理系は一つではなく，#[#LuaLaTeX]や#[#XeLaTeX]など，さまざまなものがある．処理系によって使い方が異なる．],
    [`\label`コマンドでラベルを付けた箇所を`\ref`コマンドで参照できる．番号は組版処理の際に自動的に採番される．],
    [BibTeXやBibLaTeXなどの外部パッケージが必要．書誌情報の形式はBibTeX形式．BibTeXのスタイルファイルをBibLaTeXで使うことはできない．パッケージや処理系によって使い方が異なる．],
    [「クラスファイル」を作成，編集するか，コマンドを定義，上書きする．学術機関からクラスファイルが配布されていることが多い．クラスファイルは処理系に依存していることがあり，ある処理系では使えるが，別の処理系では使えないこともある．],
    [組版結果は美しいといわれている．組版の速さはTypstに比べて遅い．],

    [*Typst*],
    [組版エンジン],
    [テキストエディタで編集したtypファイルを読み込ませて，組版処理を行い，PDFファイルを出力させる．現時点で処理系はTypst一つのみ．],
    [ラベルを付けた箇所を`\ref`コマンドまたは`@`を用いて参照できる．番号は組版処理の際に自動的に採番される．],
    [書誌情報の形式はBibTeX形式またはHayagriva形式（Typst独自の形式）．スタイルファイルとしてCSLファイルを使用できる．],
    [「テンプレート」を作成，編集する．],
    [2024年時点で日本語組版の機能が#[#LaTeX]の資産に比べて貧弱であるが，バージョンアップを重ねるごとに改善が進んでいる．組版の速さは速い．],
  ),
) <table:Word-LaTeX-Typstの比較>

= Typstの導入

Typstを利用する方法は大きく2つあります．

1. *自分のPCにインストールして利用する*\
  自分のPCにTypstとテキストエディタをインストールすることで利用します．テキストエディタでtypファイルを編集し，そのファイルをCLI等を用いてTypstに読み込ませて，組版処理とPDFファイルの出力を行います．
  - *テキストエディタとしてVisual Studio Code（VSCode）を利用する場合*\
    VSCodeはテキストファイルを編集するためのテキストエディタの一つです．Windowsの「メモ帳」などにはない，強力な文字列検索・置換機能やショートカットキーが用意されていて，プログラミングなどの場面で用いられます．\
    VSCodeには，元々のVSCodeにはない機能を追加する「拡張機能」というものがあります．typファイルをVSCodeで編集する人向けの拡張機能も存在します．「Tinymist Typst」はVSCodeの拡張機能の一つで，typファイルのプレビュー画面を表示したり，ワンクリックでPDFファイルを出力したりすることができます（#ref(<figure:tinymist-typstがインストールされたvscodeでtypファイルを編集する様子>)）．さらに，Tinymist TypstにはTypstが同梱されているので，これをインストールするだけでTypstの導入が完了します．
2. *Typst Web Application（typst.app）上で利用する*\
  Typstの関連企業であるTypst GmbHは，テキストエディタとTypstをセットにし，ブラウザから利用できるようにしたWebアプリである「Typst Web Application（typst.app）」を提供しています．typst.appを利用する場合，ブラウザでtypst.appを開き，typst.app上のテキストエディタでtypファイルを編集し，typst.appのメニューを操作して，組版処理とPDFファイルの出力を行います．\
  利用するためにはユーザ登録が必要ですが，typst.app上で作成したtypファイルはtypst.appのサーバ上に保存されるので，別のPCからtypファイルを編集することもできます．\
  フォントについては，typst.appのサーバが持っているものしか利用できません．使用したいフォントがある場合は(1)の方法で利用するしかありません．

#figure(
  placement: auto,
  scope: "column",
  [#image("./figures/figure:tinymist-typstがインストールされたvscodeでtypファイルを編集する様子.png")],
  caption: [Tinymist TypstがインストールされたVSCodeでtypファイルを編集する様子],
) <figure:tinymist-typstがインストールされたvscodeでtypファイルを編集する様子>

以下では，Typstを自分のPCにインストールして利用する場合の中でも，VSCodeとTinymist Typstで利用する場合の導入方法と，typst.appを利用する場合の導入方法を説明します．

== VSCodeとTinymist Typstを導入する方法 <heading:VSCodeとTinymist-Typstを導入する方法>

1. VSCodeをインストールします．
  - Windowsの場合は，Microsoft Storeからインストールできます．#link("https://apps.microsoft.com/detail/xp9khm4bk9fz7q", [`https://apps.microsoft.com/detail/xp9khm4bk9fz7q`])にアクセスして`インストール`ボタンをクリックします．
  - Windows以外のOSでのインストール方法は，VSCodeの公式サイト（#link("https://code.visualstudio.com", [`https://code.visualstudio.com`])）で案内されています．
2. VSCodeを起動します．
3. 拡張機能としてTinymist Typstとvscode-pdfをインストールします．
  - *Tinymist Typstのインストール*\
    #link("https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist", [`https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist`])にアクセスし，`Install`ボタンをクリックし，画面の指示に従ってインストールします．
  - *vscode-pdfのインストール*\
    #link("https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf", [`https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf`])にアクセスし，`Install`ボタンをクリックし，画面の指示に従ってインストールします．

以上で導入は完了です．VSCodeで，編集したいファイルやそれが含まれるフォルダを開けば，すぐに編集を始められます．同じフォルダに含まれる複数のファイルを同時に開けると便利な場面が多いので，typファイルを保存するためのフォルダを用意して，それをVSCodeで開くようにするのがよいでしょう．

1. エクスプローラー（macOSの場合はFinder）などで，typファイルを保存するためのフォルダを作成します．
2. VSCodeで，メニューバーの`ファイル`→`フォルダーを開く`をクリックして，(1)で作成したフォルダーを開きます．
3. VSCodeの画面左側に，そのフォルダーに含まれるファイルの一覧が表示されます．一覧から，テキストファイルの名前をダブルクリックすると，そのファイルをVSCodeで開くことができます．

== typst.appを導入する方法

typst.appを使い始める前に，typst.appにユーザ登録をする必要があります．

1. #link("https://typst.app/signup", [`https://typst.app/signup`]) にアクセスします．
2. 必要な情報を入力して，`Sign up`をクリックします．

以上で導入は完了です．#link("https://typst.app/app", [`https://typst.app/app`])にアクセスして，ログインをすれば，typst.appを使うことができます．

typst.appではtypファイルのまとまりを「Project」として管理します．typst.appを開くと最初にDashboardが表示されるので，DashboardでProjectを作成したり開いたりすると，編集を始めることができます．

= mgn901-paper-typの利用方法

== Typstの「テンプレート」とは

Typstでは，typファイルに印刷物の体裁を調整するための命令を記述することで，出力されるPDFファイルの見た目を調整することができます．さらに，見た目を調整するための命令だけが書かれたtypファイルと，印刷物の内容だけが書かれたtypファイルを分けて記述することができます．このうち，前者のファイル（見た目を調整するための命令だけが書かれたtypファイル）を「テンプレート」と呼びます．

テンプレートのファイルと内容が書かれたファイルを分けるやり方は「内容と見た目の分離」と呼ばれています．組版システムは，内容と見た目の分離を意識してファイルを用意することで本領を発揮します．

- *見た目についてのファイルが一つだけであっても，同じ見た目の印刷物を大量に作成できる．*
- *見た目についてのファイルを一回だけ編集すれば，同時に複数の印刷物の見た目を変更できる．*

== mgn901-paper-typ

「mgn901-paper-typ」は，著者（めがね901）が作成したレポート・論文組版向けのテンプレートです．実は，このPDFファイルもmgn901-paper-typを使って作成しています．

mgn901-paper-typは和文組版のための調整が施されたテンプレートです．見た目を調整するための命令を一切使わずとも印刷物は作成できますが，それだけでは，日本語の文書に向いている体裁にはなりません．mgn901-paper-typを使用することで，そこに追加の調整を加えなくても，美しく読みやすい和文のレポートや論文を作成することができます．図表や数式を組み合わせる場合でも，Wordの時のようにマウスで図表を細かく動かしたりする必要はありません．

== テンプレートの入手

mgn901-paper-typはGitHub（#link("https://github.com/mgn901/mgn901-paper-typ", [`https://github.com/mgn901/mgn901-paper-typ`])）上で公開しています．zipファイルとして入手することもできます．zipファイルは#link("https://github.com/mgn901/mgn901-paper-typ/archive/refs/heads/main.zip", [`https://github.com/mgn901/mgn901-paper-typ/archive/refs/heads/main.zip`])からダウンロードすることができます．

zipファイルをダウンロードしたら，#ref(<heading:VSCodeとTinymist-Typstを導入する方法>)で作成したtypファイルを保存するためのフォルダに展開してください．

== typファイルの作成とテンプレートのインポート

展開したファイルには，名前が`example`で始まるtypファイルが含まれているはずです．これらのファイルを直接編集するか，複製してそれを編集してください．

== typファイルの編集

Typst Japan Communityが公開している日本語版のチュートリアル @typst-jp:writing-in-typst を参考にしてください．また，展開したファイルに含まれていて，このPDFファイルの基になっている`main.typ`も参考になると思います．

== 参考文献の管理

Typstでは，文献の書誌情報だけをまとめたファイルを用意して，あらかじめ必要な命令を入力しておけば，各文献の識別子を入力するだけで文献を引用することができます．

1. typファイルの最後に次のように記述します#footnote([「`↵`」マークはそこで改行していることを意味します．紙面の都合上，長い行は折り返して組版していますが，入力の際は「`↵`」がない部分では改行しないでください．])．この記述は，`references.bib`というファイルにまとめられている文献を引用，参照できるようにするための記述です．`references.bib`はそのtypファイルと同じフォルダに保存してください．\ \
  ```typ
  #show heading.where(level: 1): set heading(numbering: none)
  #bibliography("references.bib")
  ```\
2. `references.bib`に文献の書誌情報を記述します．書誌情報の記述はBibTeX形式で行います．以下の例では，1つのファイルに2つの文献の書誌情報を記述していて，1つ目の文献の識別子は`mgn901:1`，2つ目の文献の識別子は`mgn901:2`となっています．\ \
  ```bib
  @article{mgn901:1,
    author = {めがね901},
    title = {ほげほげのふがふがの検討},
    journal = {めがね901学会論文誌},
    volume = {1},
    number = {1},
    year = {2025}
  }

  @article{mgn901:2,
    author = {mgn901},
    title = {A Consideration About Fugafuga of Hogehoge},
    journal = {Journal of mgn901},
    volume = {1},
    number = {1},
    year = {2025}
  }
  ```\
3. typファイル内で文献を参照するためには，以下のように記述します．Typstが組版処理を行う際に自動的に，文献番号が挿入され，印刷物の最後の参考文献リストに書誌情報が追加されます．\ \
  ```typ
  @mgn901:1 や @mgn901:2 は，Hogehogeの場合におけるFugafugaを検討しているが，Piyopiyoの場合については不十分である．
  ```\

*BibTeX形式の書誌情報を入手する方法*#h(1em)多くの場合，bibファイルに記述する書誌情報を，手で書き起こす必要はありません．CiNii Research @cinii やScopus @scopus 等の論文データベースや，国立国会図書館サーチ @ndl:ndlsearch のような国立図書館のデータベースの画面には，`書誌情報を出力`，`引用する`，`Cite`，`BibTex`，「`”`（二重引用符）」などのような名前のボタンがあります．そのボタンをクリックすると，BibTeX形式の書誌情報を入手することができます．Wordのように，書誌情報を手で入力したり，文献を増やすごとに番号を付け替えたり並べ替えたりする必要はありません．

*分野に合ったスタイル（書き方）で書誌情報を載せたい*#h(1em)書誌情報のスタイルは分野によって異なり，所属する学術機関によってはスタイルが決まっている場合があります．スタイルを変更したい場合は，`#bibliography()`関数を呼び出す際に`style`引数にスタイルの名前を指定してください．Typstにはいくつかのスタイルが収録されていて，その一覧は @typst:bibliography で確認することができます（ページの`View options`ボタンを押すと一覧が表示されます）．\ \
```typ
#bibliography("references.bib", style: "sist02")
```\
Typstに収録されていないスタイルにしたい場合は，Citation Style Languageで記述されたスタイルファイル（CSLファイル）を用意して，そのtypファイルと同じフォルダ（またはその中のフォルダ）に保存して，それを使用するようにtypファイルを修正してください．なおmgn901-paper-typには，おまけとして，情報処理学会論文誌のスタイルを再現#footnote([再現は完全ではありません．現在のCSLファイルの仕様上，欧文用のスタイルと和文用のスタイルを分けることはできないようです．])したCSLファイルを同梱しています．\ \
```typ
#bibliography("references.bib", style: "./libs/ipsj.lib")
```\

// 本文 終わり

// 参考文献リスト

#show heading.where(level: 1): set heading(numbering: none)
#show: type-style.with(..type-settings.footnote)
#bibliography("references.bib", style: "sist02")

// 参考文献リスト 終わり
