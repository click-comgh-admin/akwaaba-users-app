echo Type File Generator && echo Opening Directory
cd "C:\xampp\htdocs\flutter\akwaaba_user_app\lib\models\attendance\schedule\full"
echo Directory Open && echo Generating File
quicktype -l dart main.json -t AttendanceScheduleFullModel -o main.dart && echo Type File Generated Successfully!

