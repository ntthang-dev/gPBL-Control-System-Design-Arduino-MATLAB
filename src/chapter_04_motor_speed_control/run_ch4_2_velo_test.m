% run_ch4_2_velo_test.m
% Tác giả: N.T.THANG
% Ngày: 02/11/2025
% Mô tả: Script này chạy mô hình 'velo_test.mdl' để kiểm tra phần cứng
% cho thí nghiệm Chương 4 (Điều khiển tốc độ động cơ).

%% 1. KHỞI TẠO MÔI TRƯỜNG
clear;
clc;
close all;

disp('Bắt đầu Thí nghiệm Chương 4.2: Kiểm tra Phần cứng...');

%% 2. THIẾT LẬP THAM SỐ
% Thiết lập thời gian lấy mẫu (Sample Time)
% Sách đề xuất 1/50s (50Hz), nhưng cũng lưu ý rằng 
% nó có thể quá nhanh cho PC [p.061].
% Chúng ta sẽ dùng 1/20s (20Hz) để đảm bảo ổn định.
ts = 1/20; % (s) -> 20 Hz

% Thiết lập thời gian mô phỏng
sim_duration = 60; % (s) -> Chạy thí nghiệm trong 60 giây

%% 3. CHẠY MÔ HÌNH SIMULINK
% Đảm bảo rằng Arduino đã được kết nối và 'adiosrv.pde' đã được nạp.
% Đảm bảo 'velo_test.mdl' ở cùng thư mục hoặc trên MATLAB path.

model_name = 'velo_test';

try
    disp(['Đang mở mô hình: ' model_name]);
    open_system(model_name);
    
    % Gán thời gian lấy mẫu 'ts' vào workspace của Simulink
    assignin('base', 'ts', ts);

    disp(['Chạy mô phỏng trong ' num2str(sim_duration) ' giây...']);
    disp('*** HÃY XOAY CHIẾT ÁP (A1) ĐỂ KIỂM TRA TỐC ĐỘ ĐỘNG CƠ ***');
    
    % Chạy mô hình
    sim(model_name, sim_duration);
    
    disp('Hoàn thành mô phỏng.');

catch e
    disp('LỖI: Không thể chạy mô hình. Đảm bảo file "velo_test.mdl" đang ở đúng vị trí.');
    disp(e.message);
end