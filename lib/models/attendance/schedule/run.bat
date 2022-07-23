echo Type File Generator && echo Opening Directory
cd "C:\xampp\htdocs\flutter\akwaaba_user_app\lib\models\attendance\schedule"
echo Directory Open && echo Generating File
quicktype -l dart main.json -t AttendanceScheduleModel -o main.dart && echo Type File Generated Successfully!

