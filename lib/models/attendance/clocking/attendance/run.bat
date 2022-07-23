echo Type File Generator && echo Opening Directory
cd "C:\xampp\htdocs\flutter\akwaaba_user_app\lib\models\attendance\clocking\attendance"
echo Directory Open && echo Generating File
quicktype -l dart main.json -t AttendanceClockingAttendanceModel -o main.dart && echo Type File Generated Successfully!

