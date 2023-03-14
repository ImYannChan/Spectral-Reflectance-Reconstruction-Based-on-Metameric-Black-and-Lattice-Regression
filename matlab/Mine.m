function [rec_refls] = Mine(train_refl,train_rgb, test_rgb, A)
%MINE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


    %����ѵ��������ͬɫ���׺�
    R = A * pinv(A'*A) * A';
    train_black = (train_refl' - R * train_refl')';
    
    %������������Ļ����̼�
    test_s = (A * pinv(A'*A) * test_rgb')';
    
    %% ����ع��ؽ�
    rec_black=latte_reg(train_black, train_rgb, test_rgb, 0.0013, 31);
    %���������Ļ����̼��������ֵ������ͬɫ���׺�
    rec_refls = test_s + rec_black;
end

