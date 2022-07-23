echo Type File Generator && echo Opening Directory
cd "C:\xampp\htdocs\flutter\akwaaba_user_app\lib\models\users\connections"
echo Directory Open && echo Generating File
quicktype -l dart main_datatable.json -t UserConnectionsDatatableModel -o main_datatable.dart && echo Type File Generated Successfully!

