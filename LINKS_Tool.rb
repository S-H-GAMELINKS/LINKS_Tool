# encoding: Windows-31J
#LINKS�p�X�N���v�g�^�O�ꊇ�ϊ��c�[��

#�Ǎ��ϐ�str�̒�`
str = String.new

#�t�@�C�����p�ϐ�
input_filename = nil
output_filename = nil

#�t�@�C���̎w�胋�[�v
while input_filename == nil && output_filename == nil

	#�ϊ��������t�@�C�����̎w��
	print "�^�O��o�^�������t�@�C�����w�肵�Ă��������F"
	input_filename = gets.strip

	#�ϊ���̃t�@�C�����w��
	print "�^�O�o�^��̃t�@�C��������͂��Ă�������:"
	output_filename = gets.strip

end

#�w�肵���t�@�C���̓Ǎ�
text = open("#{input_filename}.txt", "r+")
str = text.read

#�^�O�̓o�^
str.gsub!(/�B/, "�BP")
str.gsub!(/�v/, "�vP")
str.gsub!(/^$/, "R")
str.gsub!(/^/, "L")

#�w�肵���t�@�C�����ŏo��
File.open("#{output_filename}.txt", "w") do |file|

	file.write str
end