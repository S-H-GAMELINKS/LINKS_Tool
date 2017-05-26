# encoding: Windows-31J
#LINKS用スクリプトタグ一括変換ツール

#各種エンジン用タグ登録メソッド
require_relative 'script_tag'

#機能選択用変数
flag = 0

#読込変数strの定義
str = String.new

#使用する機能の選択
while flag == 0

	puts "使用する機能を選択してください"
	puts "1: LINKS用タグ登録"
	puts "2:ティラノスクリプト用タグ登録"
	puts "3:吉里吉里2用タグ登録"
	puts "4:Nscripter2用タグ登録"
	puts "5:終了"
	print "使用する機能は？："
	flag = gets.to_i
end

if flag != 5 then
	script_tag(flag, str)
end