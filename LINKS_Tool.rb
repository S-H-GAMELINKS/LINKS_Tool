# encoding: Windows-31J
#LINKS�p�X�N���v�g�^�O�ꊇ�ϊ��c�[��

#�e��G���W���p�^�O�o�^���\�b�h
require_relative 'script_tag'

#�@�\�I��p�ϐ�
flag = 0

#�Ǎ��ϐ�str�̒�`
str = String.new

#�g�p����@�\�̑I��
while flag == 0

	puts "�g�p����@�\��I�����Ă�������"
	puts "1: LINKS�p�^�O�o�^"
	puts "2:�e�B���m�X�N���v�g�p�^�O�o�^"
	puts "3:�g���g��2�p�^�O�o�^"
	puts "4:Nscripter2�p�^�O�o�^"
	puts "5:�I��"
	print "�g�p����@�\�́H�F"
	flag = gets.to_i
end

if flag != 5 then
	script_tag(flag, str)
end