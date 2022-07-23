echo Type File Generator && echo Opening Directory
cd "C:\xampp\htdocs\flutter\akwaaba_user_app\lib\models\users\connections"
echo Directory Open && echo Generating File
quicktype -l dart main.json -t UserConnectionsModel -o main.dart && echo Type File Generated Successfully!

