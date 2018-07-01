# encoding: Windows-31J
#LINKS用スクリプトタグ一括変換ツール

#各種エンジン用タグ登録メソッド
require_relative 'script_tag'

#機能選択用変数
flag = 0

#読込変数strの定義
str = String.new

menu =["使用する機能を選択してください\n", "1: LINKS用タグ登録\n", "2:ティラノスクリプト用タグ登録\n",
		"3:吉里吉里2用タグ登録\n", "4:Nscripter2用タグ登録\n", "5:終了\n", "使用する機能は？："]

#使用する機能の選択
while flag != 5

	menu.each do |menu|
		print menu
	end

	flag = gets.to_i

	if flag != 5 then
		script_tag(flag, str)
	end
end