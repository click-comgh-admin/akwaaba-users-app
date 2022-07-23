echo Type File Generator && echo Opening Directory
cd "C:\xampp\htdocs\flutter\akwaaba_user_app\lib\models\attendance\schedule\days_dates"
echo Directory Open && echo Generating File
quicktype -l dart days.json -t AttendanceScheduleDayModel -o days.dart && echo Type File Generated Successfully!

