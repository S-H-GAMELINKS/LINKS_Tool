# encoding: Windows-31J
#LINKS用スクリプトタグ一括変換ツール

#読込変数strの定義
str = String.new

#ファイル名用変数
input_filename = nil
output_filename = nil

#ファイルの指定ループ
while input_filename == nil && output_filename == nil

	#変換したいファイル名の指定
	print "タグを登録したいファイルを指定してください："
	input_filename = gets.strip

	#変換後のファイル名指定
	print "タグ登録後のファイル名を入力してください:"
	output_filename = gets.strip

end

#指定したファイルの読込
text = open("#{input_filename}.txt", "r+")
str = text.read

#タグの登録
str.gsub!(/。/, "。P")
str.gsub!(/」/, "」P")
str.gsub!(/^$/, "R")
str.gsub!(/^/, "L")

#指定したファイル名で出力
File.open("#{output_filename}.txt", "w") do |file|

	file.write str
end