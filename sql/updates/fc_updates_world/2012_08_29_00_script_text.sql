-- ����������� ��������� ������ � ������� ��������
UPDATE `script_texts` SET `content_loc8` = '� ������ ������� ����������� ������������� ����� ���, ��� ������ ����������� ��������. �� ������ �������� ����!' WHERE `entry` = -1043001;
UPDATE `script_texts` SET `content_loc8` = '��� ������ ���� �����-�� ������, ������� ������� ������� �� ������������� �������������� � �����. ������ ��� ���� ������ ��������.' WHERE `entry` = -1043002;
UPDATE `script_texts` SET `content_loc8` = '�������! �� ������ ����������. ��� ����� ������� ����� ���, ������ ��� �� ������ �������� ��������� �� ��� �������.' WHERE `entry` = -1043003;
UPDATE `script_texts` SET `content_loc8` = '� ���� ����� ���� � ������ ���������� ����������, ������� ������ ������� �����, ������ ������������ ����.' WHERE `entry` = -1043004;
UPDATE `script_texts` SET `content_loc8` = '������ ���� �������. ������ �� ���� � ���������!' WHERE `entry` = -1043005;
UPDATE `script_texts` SET `content_loc8` = '������ �������, �������� �������� � ������ ���. ����� ��������� ��� ���� �� ����� ������� ������!' WHERE `entry` = -1043006;
UPDATE `script_texts` SET `content_loc8` = '��������� ����, ���������! � ���� ����������� � ���������� ���, ����� ������ ��������� � �������� ����� �����!' WHERE `entry` = -1043007;
UPDATE `script_texts` SET `content_loc8` = '��� ������� ���������� �������� ������� ��������� ����������� ���������! ��� ��������.' WHERE `entry` = -10430012;
UPDATE `script_texts` SET `content_loc8` = '��, � �������� �� ��������� �������! � ��������� ����, ��� ������ ������, ������ � ������� ����������.' WHERE `entry` = -10430015;
UPDATE `script_texts` SET `content_loc8` = '�� ������ ���� � ����������� � ������� ���������. ��������� ������� ����� ������, ������ ��� � ���� ������� ��� ���� ������� ������������ �����. ��������, ���������!' WHERE `entry` = -10430016;
UPDATE `script_texts` SET `content_loc8` = '�������-��! ��������� ����� ���������! �� �������� ���, ������ �������� �����������!' WHERE `entry` = -1043000;
UPDATE `script_texts` SET `content_loc8` = '�������-��! � ����������!' WHERE `entry` = -1043013;
UPDATE `script_texts` SET `content_loc8` = '%S ����� ��������� ������ �� ����������� ���������' WHERE `entry` = -1043008;
UPDATE `script_texts` SET `content_loc8` = '%S ��������� �������� � ��������� ���.' WHERE `entry` = -1043009;
UPDATE `script_texts` SET `content_loc8` = '%S �������� � �����. ������ �������� ��� ������!' WHERE `entry` = -1043010;
UPDATE `script_texts` SET `content_loc8` = '%S ������ �������� �������. ���-�� ��������� ��� ������ ����.' WHERE `entry` = -1043011;

-- ������� �� ������ 898
UPDATE `script_texts` SET `content_loc8` = '���� �����, $n. ��� ����������� ���� ������. �������� ��� ������� ��������� ������. �����!' WHERE `entry` = -1000370;
UPDATE `script_texts` SET `content_loc8` = '�������-��! �������� ������� �� ����������! ��� ����� �����, ����� ����������!' WHERE `entry` = -1000371;
UPDATE `script_texts` SET `content_loc8` = '������ � �������� ���� �����. ������� �������� � ������. �����, $n.' WHERE `entry` = -1000372;
UPDATE `script_texts` SET `content_loc8` = '������, ��� ����������� ����� ����� ������ ����������� �� ���������. ��� ����� ����� ���������.' WHERE `entry` = -1000373;
UPDATE `script_texts` SET `content_loc8` = '�������! $C �������!' WHERE `entry` = -1000374;
UPDATE `script_texts` SET `content_loc8` = '������ ����� ��� �����!' WHERE `entry` = -1000375;
UPDATE `script_texts` SET `content_loc8` = '$C ���� ����� �� ���!' WHERE `entry` = -1000376;
UPDATE `script_texts` SET `content_loc8` = '�������, $C' WHERE `entry` = -1000377;
UPDATE `script_texts` SET `content_loc8` = '�� ����� ���������! ����� ���������...' WHERE `entry` = -1000378;
UPDATE `script_texts` SET `content_loc8` = '��, ������� ������ ������.' WHERE `entry` = -1000379;
UPDATE `script_texts` SET `content_loc8` = '������� ����`��� �������, $N ����� ��� �������! $N, � ������, ������� ����������� ���� ��������.' WHERE `entry` = -1000380;

-- ���� ������ 4921 "��������� ��� �����"
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- ����������� ��������� ���� ������� ������.
-- �� �������, ������� �� ������
-- ���� � ���� �� ���� ���� �����-�� ������� ������ ���������, ������� ������ ��� � �����, ��� � Request.
UPDATE `script_texts` SET `content_loc8` = '�� ������ ������� ������, ������!' WHERE `entry` = -1609000;
UPDATE `script_texts` SET `content_loc8` = '�����-�� � ��� ������ �����... ����������, ��� � ����...' WHERE `entry` = -1609001;
UPDATE `script_texts` SET `content_loc8` = '������ ��� ������������ ���������!' WHERE `entry` = -1609016;
UPDATE `script_texts` SET `content_loc8` = '� ���!' WHERE `entry` IN (1609012, 1609008);
UPDATE `script_texts` SET `content_loc8` = '� ������� ���� ������� � ������� ��� ��������� �����!' WHERE `entry` = -1609005;
UPDATE `script_texts` SET `content_loc8` = '��� ��������' WHERE `entry` = -1609080;
UPDATE `script_texts` SET `content_loc8` = '������� ���� ����, $n, ��� ��� ��� ����, ����� �� ������ ��������!' WHERE `entry` = -1609081;
UPDATE `script_texts` SET `content_loc8` = '�� ����� ����.' WHERE `entry` = -1609083;
