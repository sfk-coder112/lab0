#!/bin/bash
#Лабораторная работа 1, вариант 14

git init
# # cd ~lab0
# mkdir lab0
# cd lab0/
# mkdir victor
# mkdir archive
# mkdir claude_monet
# cd victor/
# mkdir kitchen
# mkdir pastry
# mkdir hall
# mkdir reception
# mkdir management
# cd ..
# cd old_menu

mkdir -p ~/lab0/victor/kitchen
mkdir -p ~/lab0/victor/pastry
mkdir -p ~/lab0/victor/hall
mkdir -p ~/lab0/victor/reception
mkdir -p ~/lab0/victor/management
mkdir -p ~/lab0/archive
mkdir -p ~/lab0/claude_monet
mkdir -p ~/lab0/old_menu

echo "Баринов проверяет кухню ресторана Victor" > ~/lab0/victor/kitchen/barinov_plan
echo "Лёва распределяет поваров по рабочим местам" >> ~/lab0/victor/kitchen/barinov_plan
echo "Новое меню готовят к вечернему открытию" >> ~/lab0/victor/kitchen/barinov_plan

echo "Макс предлагает утку с новым соусом" > ~/lab0/victor/kitchen/max_dish
echo "Баринов разрешает приготовить пробную порцию" >> ~/lab0/victor/kitchen/max_dish
echo "Блюдо подадут первым гостям ресторана Victor" >> ~/lab0/victor/kitchen/max_dish

echo "Катя готовит шоколадный десерт" > ~/lab0/victor/pastry/katya_dessert
echo "Украшение собирают перед самой подачей" >> ~/lab0/victor/pastry/katya_dessert
echo "Элеонора ждёт результат дегустации" >> ~/lab0/victor/pastry/katya_dessert

echo "Первый стол оставлен для Элеоноры" > ~/lab0/victor/hall/opening_tables
echo "Второй стол подготовлен для Нагиева" >> ~/lab0/victor/hall/opening_tables
echo "Большой стол займёт команда ресторана" >> ~/lab0/victor/hall/opening_tables

echo "Элеонора Андреевна прибывает к открытию" > ~/lab0/victor/hall/guest_list
echo "Дмитрий Нагиев приглашён на ужин" >> ~/lab0/victor/hall/guest_list
echo "Денис выступает для гостей вечером" >> ~/lab0/victor/hall/guest_list

echo "Столик четыре забронирован на семь часов" > ~/lab0/victor/reception/reservations
echo "Столик шесть нужен постоянным гостям" >> ~/lab0/victor/reception/reservations
echo "Вика подтверждает каждую бронь" >> ~/lab0/victor/reception/reservations

echo "Элеонора требует закончить подготовку вовремя" > ~/lab0/victor/management/eleonora_order
echo "Зал должен быть готов до приезда гостей" >> ~/lab0/victor/management/eleonora_order
echo "Баринов лично представляет праздничное меню" >> ~/lab0/victor/management/eleonora_order

echo "Утром проверить работу кухни" > ~/lab0/victor/management/vika_schedule
echo "Днём провести собрание официантов" >> ~/lab0/victor/management/vika_schedule
echo "Вечером встретить первых гостей" >> ~/lab0/victor/management/vika_schedule

echo "Луковый суп из Claude Monet" > ~/lab0/archive/old_menu
echo "Мильфей от Луи" >> ~/lab0/archive/old_menu
echo "Фирменное мясо от Баринова" >> ~/lab0/archive/old_menu

echo "Команда прощается с рестораном Claude Monet" > ~/lab0/claude_monet/farewell_note
echo "Старые рецепты сохраняются в архиве" >> ~/lab0/claude_monet/farewell_note
echo "Макс обещает не забывать первую кухню" >> ~/lab0/claude_monet/farewell_note

echo "Ресторан Victor открывается вечером" > ~/lab0/opening_day
echo "Баринов волнуется за новую команду" >> ~/lab0/opening_day
echo "Вика проверяет последние приготовления" >> ~/lab0/opening_day

chmod 755 ~/lab0/victor
chmod u=rwx,g=rx,o= ~/lab0/victor/kitchen
chmod 640 ~/lab0/victor/kitchen/barinov_plan
chmod u=rw,g=r,o= ~/lab0/victor/kitchen/max_dish
chmod 750 ~/lab0/victor/pastry
chmod u=rw,g=r,o= ~/lab0/victor/pastry/katya_dessert
chmod u=rwx,g=rx,o= ~/lab0/victor/hall
chmod 644 ~/lab0/victor/hall/opening_tables
chmod u=rw,g=r,o=r ~/lab0/victor/hall/guest_list
chmod 750 ~/lab0/victor/reception
chmod 640 ~/lab0/victor/reception/reservations
chmod u=rwx,g=rx,o= ~/lab0/victor/management
chmod u=rw,g=r,o= ~/lab0/victor/management/eleonora_order
chmod 640 ~/lab0/victor/management/vika_schedule
chmod u=rwx,g=rx,o= ~/lab0/archive
chmod 644 ~/lab0/archive/old_menu
chmod 755 ~/lab0/claude_monet
chmod u=rw,g=r,o= ~/lab0/claude_monet/farewell_note
chmod u=rw,g=r,o=r ~/lab0/opening_day

cp ~/lab0/opening_day ~/lab0/victor/management/opening_copy
cp -r ~/lab0/claude_monet ~/lab0/archive/claude_backup
ln -s victor/kitchen/barinov_plan ~/lab0/victor_menu
ln -s ../hall ~/lab0/victor/reception/hall_access
ln ~/lab0/victor/hall/guest_list ~/lab0/victor/hall/guest_list_copy
cat ~/lab0/victor/kitchen/max_dish ~/lab0/victor/pastry/katya_dessert > ~/lab0/victor/kitchen/tasting_menu
cat ~/lab0/victor/reception/reservations >> ~/lab0/victor/management/vika_schedule
mv ~/lab0/claude_monet/farewell_note ~/lab0/victor/management/farewell_note

ls -lR ./ |  grep "^-" | grep -v "copy"  | sort -k5,5 -n -r | head -n 5
grep -rhiE "victor|баринов" victor archive | grep -v "старт" | sort -r | head -n 6
grep -rlE "макс|кухн" victor/kitchen archive/claude_backup | wc -l
{ head -q -n 1 victor/hall/  victor/hall/opening_*; tail -q -n 1 victor/hall/guest_* victor/hall/opening_*; } | grep -iE "гост|стол" | sort
grep -v "десерт" victor/kitchen/tasting_menu | grep -E "макс|блюд" | sort -r | wc -w 
ls -lR | grep -E "^-.{9} 2 " | sort -k9 -r
ls -lR | grep "^l" | sort -k9,9 | head -n 1

rm ~/lab0/victor/management/opening_copy
rm ~/lab0/victor_menu
rm ~/lab0/victor/reception/hall_access
rm ~/lab0/victor/hall/guest_list_copy
rm ~/lab0/victor/management/farewell_note
rmdir ~/lab0/claude_monet
rm ~/lab0/archive/old_menu
rm -r ~/lab0/archive/claude_backup

git add .
git commit -m "	lab0"
git push https://github.com/sfk-coder112