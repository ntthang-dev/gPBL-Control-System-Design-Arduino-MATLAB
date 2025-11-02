# gPBL: Control System Design with Arduino and MATLAB

[![Status](https://img.shields.io/badge/status-in_progress-yellow.svg)](https://github.com/ntthang-dev/gPBL-Control-System-Design-Arduino-MATLAB)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

[cite_start]This repository contains all project files, source code, experiment data, and reports for the 20XX Online global Project Based-Learning (gPBL) program [cite: 12] [cite_start]on Power System Control Training [cite: 14][cite_start], hosted by Shibaura Institute of Technology (SIT)[cite: 18].

This project involves practical experiments based on the textbook **"Control System Design: Getting Started with Arduino and MATLAB"**. The primary goal is to bridge control theory with hands-on application using Model-Based Design (MBD).

[cite_start]**Partner Universities:** 
* Shibaura Institute of Technology (SIT), Japan
* Ho Chi Minh City University of Technology (HCMUT), Vietnam
* Hanoi University of Science and Technology (HUST), Vietnam
* Institut Teknologi Bandung (ITB), Indonesia
* Thai-Nichi Institute of Technology (TNI), Thailand

---

## Repository Structure

This repository is organized to separate code, data, and documentation clearly.
```
├── .gitignore # Files for Git to ignore (MATLAB temp files, etc.) 
├── LICENSE # Project license (MIT) 
├── README.md # This file 
├── docs/ # Setup guides, hardware diagrams, and datasheets 
├── data/ # Raw and processed data from experiments 
├── src/ # All MATLAB (.m) and Simulink (.mdl) source code 
└── reports/ # Weekly reports and final presentations
```
---

## 🚀 Getting Started

Follow these steps to set up the project environment on your local machine.

### Prerequisites

**Hardware:**
* Arduino Mega 2560 R3
* Custom Motor/Servo Kit (for Chapters 4, 5)
* Ball & Beam Kit (for Chapters 6, 7)

**Software:**
* **MATLAB/Simulink** (R2021b or newer) [cite: 613]
* **Required Toolboxes:**
    * Control System Toolbox [cite: 466]
    * Simulink
    * MATLAB Coder / Simulink Coder (for RoTH)
* **Arduino IDE** (for drivers and setup) [cite: 240]
* **ArduinoIO Library** (for communication with Simulink)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/gPBL-Control-System-Design-Arduino-MATLAB.git](https://github.com/your-username/gPBL-Control-System-Design-Arduino-MATLAB.git)
    cd gPBL-Control-System-Design-Arduino-MATLAB
    ```
2.  **Set up the Environment:**
    * Follow the detailed instructions in `docs/setup_guide.md`.
    * Install the required MATLAB Toolboxes.
    * Install the ArduinoIO library and upload the `adiosrv.pde` sketch to your Arduino.
3.  **Set MATLAB Path:**
    * Open MATLAB.
    * Add the `src/` directory and all its subfolders to the MATLAB path.
    * Run `src/lib/sim_init.m` to initialize workspace variables and parameters.

---

## 🔬 How to Use

Each chapter's experiments are self-contained in the `src/` folder.

1.  Navigate to the desired chapter, e.g., `src/chapter_05_motor_position_control/`.
2.  Ensure your hardware is connected as shown in `docs/hardware_setup.md`.
3.  Open the corresponding Simulink model (e.g., `pos_pid_mbd_s1.mdl`).
4.  Run the simulation. Experimental data will be saved to the corresponding `data/` folder.

### Key Project Files

* **`src/chapter_05_motor_position_control/pos_pid_mbd_s1.mdl`**: PID control design for motor position using Pole Assignment.
* **`src/chapter_07_modern_control_theory/bb_lqr_hg_s1.mdl`**: Optimal State Feedback (LQR) control for the Ball & Beam system.
* **`src/chapter_08_run_on_target_hardware/bbt_pid_hg_s1.mdl`**: Real-time PID controller running directly on the Arduino Mega (RoTH).

---

## License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.

## Acknowledgments

* **Prof. Goro Fujita**  and the Power System Lab at SIT.
* **Co-organizer:** Elysa Nensy Irawan.
* **TA:** Castillo Efrain.
* All fellow participants and faculty from HCMUT, HUST, ITB, and TNI.

---

## Notes for SIT Partners (SITの皆様へ)

<details>
<summary>
Click here to read the project description in Japanese (日本語でのプロジェクト概要はこちらをクリックしてください)
</summary>

<br>

**プロジェクト概要**

このリポジトリは、芝浦工業大学（SIT）主催のオンラインgPBL「電力系統制御トレーニング」のプロジェクトファイルです。

ホーチミン市工科大学（HCMUT）の学生として、教科書「ArduinoとMATLABで始める制御システム設計」に基づき、MATLAB/SimulinkとArduinoを用いたモデルベースデザイン（MBD）の実践に取り組んでいます。

ご指導のほど、よろしくお願いいたします。

</details>