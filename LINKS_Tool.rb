# encoding: Windows-31J
#LINKS�p�X�N���v�g�^�O�ꊇ�ϊ��c�[��

#�e��G���W���p�^�O�o�^���\�b�h
require_relative 'script_tag'

#�@�\�I��p�ϐ�
flag = 0

#�Ǎ��ϐ�str�̒�`
str = String.new

menu =["�g�p����@�\��I�����Ă�������\n", "1: LINKS�p�^�O�o�^\n", "2:�e�B���m�X�N���v�g�p�^�O�o�^\n",
		"3:�g���g��2�p�^�O�o�^\n", "4:Nscripter2�p�^�O�o�^\n", "5:�I��\n", "�g�p����@�\�́H�F"]

#�g�p����@�\�̑I��
while flag != 5

	menu.each do |menu|
		print menu
	end

	flag = gets.to_i

	if flag != 5 then
		script_tag(flag, str)
	end
end